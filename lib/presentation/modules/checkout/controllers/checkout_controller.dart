// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../base/controllers/base_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class CheckoutController extends GetxController {
  DateTime timeBackPressed = DateTime.now();

  String? selectedPayment;
  RxBool isButtonActive = RxBool(false);

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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    selectedPayment = null;
    isButtonActive.value = false;
    debugPrint(selectedPayment);
    debugPrint(selectedPayment);
    debugPrint(isButtonActive.value.toString());

    update();
    super.onClose();
  }

  onBack() {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(milliseconds: 500);
    timeBackPressed = DateTime.now();
    if (isExitWarning) {
      Get.find<BaseController>().changeScreen(1);
      onClose();
      return Get.offNamed(Routes.BASE);
    }
  }

  onSelectedPayment(String newPayment) {
    selectedPayment = newPayment;
    isButtonActive.value = selectedPayment!.isNotEmpty;
    update();
    debugPrint(isButtonActive.value.toString());
    debugPrint(newPayment);
  }

  onTapOrder() async {
    await Future.delayed(const Duration(milliseconds: 1200))
        .then((value) => Get.back());
    Get.find<CartController>().onPurchaseNowPressed();
    onClose();
    Get.find<BaseController>().changeScreen(2);
    Get.offNamed(Routes.BASE);
    update();
  }
}
