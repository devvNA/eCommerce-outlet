// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final outletController = TextEditingController();
  final alamatController = TextEditingController();
  String? selectedPayment;
  final isButtonActive = false.obs;
  final formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get paymentDropDownItems {
    List<DropdownMenuItem<String>> paymentItems = [
      const DropdownMenuItem(value: "Sultan", child: Text("Sultan")),
      const DropdownMenuItem(value: "Regular", child: Text("Regular")),
      const DropdownMenuItem(value: "Silver", child: Text("Silver")),
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
    super.onClose();
  }

  onSelectedPayment(String newPayment) {
    selectedPayment = newPayment;
    isButtonActive.value = selectedPayment!.isNotEmpty;
    update();
    log(newPayment);
  }
}
