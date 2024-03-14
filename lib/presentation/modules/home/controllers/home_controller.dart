// ignore_for_file: invalid_use_of_protected_member, unnecessary_overrides

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/datasources/produk_remote_datasources.dart';
import 'package:marvelindo_outlet/data/repositories/produk_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/produk_usecase.dart';
import '../../../../data/models/produk/produk_model.dart';

class HomeController extends GetxController {
  final listProduk = <Produk>[].obs;
  final searchList = <Produk>[].obs;
  final loading = false.obs;
  final selectedIndex = 0.obs;
  final searchController = TextEditingController().obs;
  final auth = FirebaseAuth.instance.obs;

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
    if (selectedIndex.value == 0) {
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

  void onSearchProduct(String text) async {
    searchList.clear();
    for (var element in listProduk) {
      if (element.nama!.toLowerCase().contains(text)) {
        searchList.add(element);
      }
      update();
    }
  }

  // getDummyProducts() {
  //   // products = DummyHelper.products;
  // }

  String getUsername() {
    return auth.value.currentUser?.displayName ?? "Invalid";
  }

  String getEmail() {
    return auth.value.currentUser?.email ?? "Invalid";
  }

  String getDisplayProfile() {
    return auth.value.currentUser?.photoURL ??
        "https://media.istockphoto.com/id/1289670343/vector/invalid-stamp-invalid-label-round-grunge-sign.jpg?s=612x612&w=0&k=20&c=p654_tY0_Nd5N0yYbE9aNJpblSykywX9nw0g_fe4D5k=";
  }
}
