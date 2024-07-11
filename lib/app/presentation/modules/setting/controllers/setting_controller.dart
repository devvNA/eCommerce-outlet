// ignore_for_file: unnecessary_overrides, deprecated_member_use, void_checks, unused_import

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../../core/networking/firebase_auth_services.dart';
import '../../../../data/datasources/auth_remote_datasources.dart';
import '../../../../data/repositories/auth_repository_impl.dart';
import '../../../../domain/usecase/auth_usecase.dart';
import '../../../../routes/app_pages.dart';
import '../../../global/theme/my_colors.dart';

class SettingController extends GetxController {
  final box = GetStorage();
  final Uri url = Uri.parse('https://wa.me/6283871647864/');

  @override
  void onInit() {
    super.onInit();
  }

  signOut() async {
    await FirebaseAuthServices.signOut();
    await box.erase();
    return Get.offAllNamed(Routes.SPLASH);

    // var response = await AuthUseCase(
    //         repository: AuthRepositoryImpl(
    //             remoteDataSource: AuthRemoteDataSourceImpl()))
    //     .logout();
    // box.erase();
    // response.fold((failure) => log(failure.message), (r) {
    //   return Get.offAllNamed(Routes.SPLASH);
    // });
  }

  // toProfilePage() async {
  //   if (FirebaseAuthServices.isLoggedIn()) {
  //     Get.toNamed(Routes.PROFIL);
  //   } else {
  //     Get.defaultDialog(
  //       title: "Peringatan",
  //       titlePadding: const EdgeInsets.only(top: 13),
  //       buttonColor: AppColors.primaryColor,
  //       cancelTextColor: AppColors.primaryColor,
  //       contentPadding: const EdgeInsets.all(12),
  //       textCancel: "kembali",
  //       textConfirm: "login",
  //       confirmTextColor: Colors.white,
  //       onCancel: () => Get.back(),
  //       onConfirm: toLoginPage,
  //       middleText: "Anda harus login terlebih dahulu",
  //     );
  //   }
  // }

  toEditProfilePage() async {
    Get.toNamed(Routes.PROFIL);

    // if (FirebaseAuthServices.isLoggedIn()) {
    //   Get.toNamed(Routes.PROFIL);
    // } else {
    //   Get.defaultDialog(
    //     title: "Peringatan",
    //     titlePadding: const EdgeInsets.only(top: 13),
    //     buttonColor: AppColors.primaryColor,
    //     cancelTextColor: AppColors.primaryColor,
    //     contentPadding: const EdgeInsets.all(12),
    //     textCancel: "kembali",
    //     textConfirm: "login",
    //     confirmTextColor: Colors.white,
    //     onCancel: () => Get.back(),
    //     onConfirm: toLoginPage,
    //     middleText: "Anda harus verifikasi terlebih dahulu",
    //   );
    // }
  }

  toLoginPage() async {
    Timer(const Duration(milliseconds: 300), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  // onKontak() async {
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  onContact() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+6283871647864',
      text: "Hai, Saya ingin memesan produk di CV Marvelindo Utama",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launchUrlString" method is part of "url_launcher_string".
    await launchUrlString('$link');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    update();
  }
}
