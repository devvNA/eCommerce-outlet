// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilController extends GetxController {
  final alamatController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  final namaController = TextEditingController().obs;
  final outletController = TextEditingController().obs;

  final listJenisOutlet = [
    const DropdownMenuItem(value: "Sultan", child: Text("Sultan")),
    const DropdownMenuItem(value: "Regular", child: Text("Regular")),
    const DropdownMenuItem(value: "Silver", child: Text("Silver")),
  ].obs;

  String? selectedOutlet;

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
    log(outlet);
  }
}
