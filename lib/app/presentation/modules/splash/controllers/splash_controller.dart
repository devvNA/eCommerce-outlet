// ignore_for_file: unnecessary_null_comparison, unnecessary_overrides

import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/networking/firebase_auth_services.dart';
import '../../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
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
}
