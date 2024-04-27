// ignore_for_file: invalid_use_of_protected_member, unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/data/datasources/produk_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/produk_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/produk_usecase.dart';

import '../../../../core/utils/helpers/debouncer.dart';
import '../../../../data/models/produk/produk_model.dart';

class HomeController extends GetxController {
  final debouncerC = DebouncerC(duration: const Duration(milliseconds: 800));
  final listProduk = <Produk>[].obs;
  final loading = false.obs;
  final searchController = TextEditingController();
  final searchList = <Produk>[].obs;
  final selectedIndex = 0.obs;

  List<String> categories = [
    "semua",
    "perdana",
    "voucher",
    "unlimited",
    "paket data",
  ];

  @override
  void onInit() {
    getAllProductsAPI();
    super.onInit();
  }

  void onRefreshProducts() {
    if (selectedIndex() == 0) {
      getAllProductsAPI();
    } else {
      getAllProductsAPIByKategori(categories[selectedIndex.value]);
    }
  }

  void onChangeCategory(int index) {
    listProduk().clear();
    selectedIndex(index);
    onRefreshProducts();
    log("index-${selectedIndex.toString()} : '${categories[index].toString()}'");
  }

  void getAllProductsAPI() async {
    loading(true);
    var response = await ProdukUseCase(
            repository: ProdukRepositoryImpl(
                remoteDataSource: ProdukRemoteDataSourceImpl()))
        .getListProduct();
    response.fold((failure) => log("Error: ${failure.message}"),
        (products) => listProduk.value = products);
    loading(false);
  }

  void getAllProductsAPIByKategori(String kategori) async {
    loading(true);
    var response = await ProdukUseCase(
            repository: ProdukRepositoryImpl(
                remoteDataSource: ProdukRemoteDataSourceImpl()))
        .getListProductByCategory(kategori);
    response.fold((failure) => log("Error: ${failure.message}"),
        (products) => listProduk.value = products);
    loading(false);
  }

  void onSearchProduct() async {
    debouncerC.run(() {
      searchList.clear();
      onRefreshProducts();
      for (var element in listProduk) {
        if (element.nama!.toLowerCase().contains(searchController.text)) {
          searchList.clear();
          searchList.add(element);
        }
      }
    });
  }
}
