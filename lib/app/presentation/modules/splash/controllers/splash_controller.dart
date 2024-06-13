// ignore_for_file: unnecessary_null_comparison, unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/networking/firebase_auth_services.dart';
import '../../../../routes/app_pages.dart';

class SplashController extends GetxController {
  String? obtainedToken;
  String? savedEmail;
  final box = GetStorage();
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // getValidationData().whenComplete(() async {
    //   if (savedEmail != null) {
    //     Get.offNamed(Routes.BASE);
    //   } else {
    //     Get.offNamed(Routes.LOGIN);
    //   }
    // });
    if (FirebaseAuthServices.isLoggedIn()) {
      log("ACCESS TOKEN : ${box.read("accessToken") ?? 'EMPTY'}");
      Get.offNamed(Routes.BASE);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getValidationData() async {
    var obtainedToken = box.read("token");
    savedEmail = obtainedToken;
    log("Token: $savedEmail");
  }
}
