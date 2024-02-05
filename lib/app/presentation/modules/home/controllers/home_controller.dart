// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/data/datasources/products_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/product_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/product_usecase.dart';
import '../../../../data/models/produk/produk_model.dart';

class HomeController extends GetxController {
  RxList<Produk> listProducts = List<Produk>.empty(growable: true).obs;
  var loading = false.obs;
  var selectedIndex = 0.obs;
  var searchList = <Produk>[].obs;
  final searchController = TextEditingController();

  final categories = ["semua", "perdana", "voucher", "unlimited", "paket data"];

  @override
  void onInit() {
    super.onInit();
    getAllProductsAPI();
  }

  void onRefreshProducts() {
    listProducts.value.clear();
    if (selectedIndex.value == 0) {
      getAllProductsAPI();
    } else {
      getAllProductsAPIByKategori(categories[selectedIndex.value]);
    }
    update();
  }

  void onChangeCategory(int index) {
    selectedIndex(index);
    onRefreshProducts();
    log("index-${selectedIndex.toString()}");
    log(categories[index].toString());
    update();
  }

  Future getAllProductsAPI() async {
    loading(true);
    var response = await ProductUseCase(
            repository: ProductRepositoryImpl(
                remoteDataSource: ProductRemoteDataSourceImpl()))
        .getListProduct();
    response.fold((failure) => log("Error: ${failure.message}"),
        (products) => listProducts.value = products);
    loading(false);
    update();
  }

  Future getAllProductsAPIByKategori(String kategori) async {
    loading(true);
    var response = await ProductUseCase(
            repository: ProductRepositoryImpl(
                remoteDataSource: ProductRemoteDataSourceImpl()))
        .getListProductByCategory(kategori);
    response.fold((failure) => log("Error: ${failure.message}"),
        (products) => listProducts.value = products);
    loading(false);

    update();
  }

  Future<void> onSearchProduct(String text) async {
    loading(true);
    searchList.clear();
    for (var element in listProducts) {
      if (element.nama.toLowerCase().contains(text)) {
        searchList.add(element);
      }
      update();
    }

    loading(false);
    update();
  }

  // getDummyProducts() {
  //   // products = DummyHelper.products;
  // }
}
