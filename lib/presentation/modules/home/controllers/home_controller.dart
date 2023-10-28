import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/utils/dummy_helper.dart';
import '../../../../data/models/product_model.dart';

class HomeController extends GetxController {
  bool tabStatus = true;
  int? selectedIndex = 0;

  final categories = Rx([
    "Semua",
    "Perdana",
    "Voucher",
  ]);
  List<ProductModel> products = [];

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  onChangeTab(int index) {
    selectedIndex = index;
    update();
    debugPrint(selectedIndex.toString());
    debugPrint(categories.value[index].toString());
  }

  toogleTab() {
    tabStatus = !tabStatus;
    debugPrint(tabStatus.toString());
    update();
  }

  getProducts() {
    products = DummyHelper.products;
  }
}
