// ignore_for_file: invalid_use_of_protected_member, unnecessary_overrides, unused_element

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/datasources/produk_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/produk_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/produk_usecase.dart';

import '../../../../core/utils/helpers/debouncer.dart';
import '../../../../data/models/produk_model.dart';

class HomeController extends GetxController {
  final debouncerC = DebouncerC(duration: const Duration(milliseconds: 500));
  final listProduk = <Produk>[].obs;
  final loading = false.obs;
  final searchController = TextEditingController();
  final searchList = <Produk>[].obs;
  final selectedIndex = 0.obs;
  final box = GetStorage();
  final outlet = UserManager().currentOutlet;
  final listCategories = <String>[].obs;

  @override
  void onInit() {
    getCategories();
    getAllProductsAPI();
    super.onInit();
  }

  getCategories() async {
    loading(true);
    var category = await ProdukUseCase(
            repository: ProdukRepositoryImpl(
                remoteDataSource: ProdukRemoteDataSourceImpl()))
        .getCategoryList();
    category.fold(
      (failure) => log("Error: ${failure.message}"),
      (categories) {
        listCategories.value = categories;
        listCategories.value = ["Semua", ...categories];
      },
    );
    loading(false);
  }

  void onRefreshProducts() {
    if (selectedIndex() == 0) {
      getAllProductsAPI();
    } else {
      getAllProductsAPIByKategori(listCategories[selectedIndex.value]);
    }
  }

  void onChangeCategory(int index) {
    listProduk().clear();
    selectedIndex(index);
    onRefreshProducts();
    log("index-${selectedIndex.toString()} : '${listCategories[index].toString()}'");
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
        .getListProductByCategory(kategori: kategori);
    response.fold((failure) => log("Error: ${failure.message}"),
        (products) => listProduk.value = products);
    loading(false);
  }

  void onSearchProduct() async {
    debouncerC.run(() async {
      String searchText = searchController.text.toLowerCase();
      if (searchText.isEmpty) {
        // Jika teks pencarian kosong, tampilkan semua produk
        searchList.assignAll(listProduk);
      } else {
        // Bersihkan searchList sebelum melakukan pencarian
        searchList.clear();
        // Lakukan pencarian berdasarkan teks yang dimasukkan
        var filteredList = listProduk
            .where(
                (element) => element.nama!.toLowerCase().contains(searchText))
            .toList();
        searchList.assignAll(filteredList);
      }
      onRefreshProducts();
    });
  }
  // void onSearchProduct() async {
  //   debouncerC.run(() {
  //     searchList.clear();
  //     onRefreshProducts();
  //     for (var element in listProduk) {
  //       if (element.nama!.toLowerCase().contains(searchController.text)) {
  //         searchList.clear();
  //         searchList.add(element);
  //       }
  //     }
  //   });
  // }

  @override
  void onClose() {
    super.onClose();
  }
}
