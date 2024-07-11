// ignore_for_file: unnecessary_overrides

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PoliciesPrivacyController extends GetxController {
  final overlay = SystemUiOverlayStyle.light.obs;

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
