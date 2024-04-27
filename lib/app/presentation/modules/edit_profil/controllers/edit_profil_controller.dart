// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final outletController = TextEditingController();
  final alamatController = TextEditingController();
  String? selectedOutlet;
  final formKey = GlobalKey<FormState>();

  final paymentItems = [
    const DropdownMenuItem(value: "Sultan", child: Text("Sultan")),
    const DropdownMenuItem(value: "Regular", child: Text("Regular")),
    const DropdownMenuItem(value: "Silver", child: Text("Silver")),
  ];

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

  onSelectedOutlet(String outlet) {
    selectedOutlet = outlet;
    update();
    log(outlet);
  }
}
