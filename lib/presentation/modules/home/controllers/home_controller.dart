// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/datasources/products_remote_datasources.dart';
import 'package:marvelindo_outlet/data/repositories/product_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/product_usecase.dart';

import '../../../../core/types.dart';

class HomeController extends GetxController {
  Rx<ListProduk> listProducts = Rx<ListProduk>([]);
  RxBool loading = RxBool(false);
  RxInt selectedIndex = RxInt(0);
  Rx<ListProduk> searchList = Rx<ListProduk>([]);

  final categories =
      RxList(["semua", "perdana", "voucher", "unlimited", "paket data"]);

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
      getAllProductsAPIByKategori(categories.value[selectedIndex.value]);
    }
    update();
  }

  void onChangeCategory(int index) {
    selectedIndex(index);
    onRefreshProducts();
    log("index-${selectedIndex.toString()}");
    log(categories.value[index].toString());
    update();
  }

  Future getAllProductsAPI() async {
    loading(true);
    var response = await ProductUseCase(
            repository: ProductRepositoryImpl(
                remoteDataSource: ProductRemoteDataSourceImpl()))
        .getListProduct();
    response.fold((failure) => printError(info: "Error: ${failure.message}"),
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

  void onSearchProduct(String text) {
    loading(true);
    searchList.value.clear();
    if (text.isEmpty) {
      for (var element in listProducts.value) {
        searchList.value.add(element);
        update();
      }
      update();
    } else {
      for (var element in listProducts.value) {
        if (element.nama!.toLowerCase().contains(text)) {
          searchList.value.add(element);
          update();
        }
        update();
      }
    }
    loading(false);
    update();
  }

  // getDummyProducts() {
  //   // products = DummyHelper.products;
  // }
}
