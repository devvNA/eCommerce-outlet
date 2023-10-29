import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/usecase/product_usecase.dart';

class HomeController extends GetxController {
  final listProducts = Rx([]);
  ProductUseCase productUseCase;

  HomeController({required this.productUseCase});

  bool tabStatus = true;
  int selectedIndex = 0;

  final categories = Rx([
    "Semua",
    "Perdana",
    "Voucher",
  ]);
  // List<ProductModel> products = [];

  @override
  void onInit() {
    super.onInit();
    getProductsAPI();
    // getProducts();
  }

  onRefreshProducts() {
    listProducts.value.clear();
    getProductsAPI();

    update();
  }

  onChangeTab(int index) {
    selectedIndex = index;
    update();
    debugPrint("index-${selectedIndex.toString()}");
    debugPrint(categories.value[index].toString());
  }

  toogleTab() {
    tabStatus = !tabStatus;
    debugPrint(tabStatus.toString());
    update();
  }

  getProducts() {
    // products = DummyHelper.products;
  }

  Future getProductsAPI() async {
    var response = await productUseCase.getListProduct();
    response.fold((failure) => printError(info: " Error: ${failure.message}"),
        (products) => listProducts.value = products);
    notifyChildrens();
    update();
  }
}
