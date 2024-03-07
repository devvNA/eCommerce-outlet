// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/presentation/global/theme/my_colors.dart';
import '../../../../core/networking/firebase_auth_services.dart';
import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  FirebaseAuthService firebaseAuth = FirebaseAuthServiceImpl();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    final box = GetStorage();
    box.remove("accessToken");
    await Get.offAllNamed(Routes.SPLASH);
  }

  void profilePage() {
    if (firebaseAuth.isLoggedIn()) {
      Get.toNamed(Routes.PROFIL);
    } else {
      Get.defaultDialog(
          buttonColor: AppColors.primaryColor,
          cancelTextColor: AppColors.primaryColor,
          contentPadding: const EdgeInsets.all(12),
          textCancel: "kembali",
          textConfirm: "login",
          onCancel: () => Get.back(),
          onConfirm: () => Get.offAllNamed(Routes.LOGIN),
          middleText: "Anda harus login terlebih dahulu");
    }
  }
}
