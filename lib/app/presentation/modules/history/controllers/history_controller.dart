// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// controller
class HistoryController extends GetxController {
  RxInt selectedIndex = RxInt(0);

  final tabs = [
    const Text("Proses"),
    const Text("Selesai"),
    const Text("Dibatalkan"),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    changeStatus(0);
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void changeStatus(int index) {
    selectedIndex.value = index;
  }
}
