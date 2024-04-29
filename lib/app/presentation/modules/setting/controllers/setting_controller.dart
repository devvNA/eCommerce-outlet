// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/networking/firebase_auth_services.dart';
import '../../../global/theme/my_colors.dart';
import '../../../../routes/app_pages.dart';

class SettingController extends GetxController {
  final Uri url = Uri.parse('https://wa.me/6283871647864/');

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signOut() async {
    await FirebaseAuthServices.signOut();
    final box = GetStorage();
    box.remove("accessToken");
    await Get.offAllNamed(Routes.SPLASH);
  }

  toProfilePage() async {
    if (FirebaseAuthServices.isLoggedIn()) {
      Get.toNamed(Routes.PROFIL);
    } else {
      Get.defaultDialog(
        title: "Peringatan",
        titlePadding: const EdgeInsets.only(top: 13),
        buttonColor: AppColors.primaryColor,
        cancelTextColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.all(12),
        textCancel: "kembali",
        textConfirm: "login",
        confirmTextColor: Colors.white,
        onCancel: () => Get.back(),
        onConfirm: toLoginPage,
        middleText: "Anda harus login terlebih dahulu",
      );
    }
  }

  toEditProfilePage() async {
    if (FirebaseAuthServices.isLoggedIn()) {
      Get.toNamed(Routes.EDIT_PROFIL);
    } else {
      Get.defaultDialog(
        title: "Peringatan",
        titlePadding: const EdgeInsets.only(top: 13),
        buttonColor: AppColors.primaryColor,
        cancelTextColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.all(12),
        textCancel: "kembali",
        textConfirm: "login",
        confirmTextColor: Colors.white,
        onCancel: () => Get.back(),
        onConfirm: toLoginPage,
        middleText: "Anda harus login terlebih dahulu",
      );
    }
  }

  toLoginPage() async {
    Timer(const Duration(milliseconds: 300), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  onKontak() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
