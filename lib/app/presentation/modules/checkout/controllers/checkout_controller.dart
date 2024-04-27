// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang/keranjang_model.dart';

import '../../base/controllers/base_controller.dart';

class CheckoutController extends GetxController {
  List<Keranjang> checkoutProduk =
      Get.arguments; //Menampung data kiriman halaman keranjang

  String? selectedPayment;
  final isButtonActive = false.obs;

  List<DropdownMenuItem<String>> get paymentDropDownItems {
    List<DropdownMenuItem<String>> paymentItems = [
      const DropdownMenuItem(value: "COD", child: Text("COD")),
      const DropdownMenuItem(value: "Transfer", child: Text("Transfer")),
    ];
    return paymentItems;
  }

  @override
  void onInit() {
    super.onInit();
  }

  onSelectedPayment(String newPayment) {
    selectedPayment = newPayment;
    isButtonActive.value = selectedPayment!.isNotEmpty;
    update();
    log(newPayment);
  }

  onTapOrder() async {
    // selectedPayment = null;
    // isButtonActive.value = false;
    // Get.find<CartController>().onPurchaseNowPressed();
    await Future.delayed(const Duration(milliseconds: 1200))
        .then((value) => Get.back());
    Get.back();
    Get.find<BaseController>().changeScreen(2);
    Get.back();
    update();
  }
}
