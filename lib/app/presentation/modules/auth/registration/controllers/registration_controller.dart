// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final alamat = TextEditingController().obs;
  final nama = TextEditingController().obs;
  final nomorHandphone = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();

  String? selectedOutlet;
  List<DropdownMenuItem<String>> paymentItems = [
    const DropdownMenuItem(value: "Sultan", child: Text("Sultan")),
    const DropdownMenuItem(value: "Regular", child: Text("Regular")),
    const DropdownMenuItem(value: "Silver", child: Text("Silver")),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onSubmit() {
    Get.back();
  }

  onSelectedOutlet(String outlet) {
    selectedOutlet = outlet;
    update();
    log(outlet);
  }
}
