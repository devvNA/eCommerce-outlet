// ignore_for_file: unnecessary_null_comparison, unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';

import '../../../../routes/app_pages.dart';

class SplashController extends GetxController {
  String? obtainedToken;
  String? savedEmail;
  final box = GetStorage();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    getValidationData().whenComplete(() async {
      if (savedEmail != null) {
        await UserManager().loadUserData();
        Get.offNamed(Routes.BASE);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
    super.onInit();
  }

  Future<void> getValidationData() async {
    var obtainedToken = box.read("TOKEN");
    savedEmail = obtainedToken;
    log("Token: $savedEmail");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
