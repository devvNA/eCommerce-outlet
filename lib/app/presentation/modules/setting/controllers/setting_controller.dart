// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/auth_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/auth_usecase.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../../routes/app_pages.dart';

class SettingController extends GetxController {
  final Uri url = Uri.parse('https://wa.me/6283871647864/');
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  bool get isDisposed => !GetInstance().isRegistered<SettingController>();

  Future<void> signOut() async {
    if (isDisposed) return;
    await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .logout();
    box.remove("TOKEN");
    log("Token Terhapus");
    await Get.offAllNamed(Routes.SPLASH);
  }

  toProfilePage() async {
    if (isDisposed) return;
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
    //     middleText: "Anda harus login terlebih dahulu",
    //   );
    // }
  }

  toEditProfilePage() async {
    if (isDisposed) return;
    Get.toNamed(Routes.PROFIL);
    // if (FirebaseAuthServices.isLoggedIn()) {
    //   Get.toNamed(Routes.PROFIL);
    // } else {
    //   Get.defaultDialog(
    //     title: "Peringatan",
    //     titlePadding: EdgeInsets.only(top: 13),
    //     buttonColor: AppColors.primaryColor,
    //     cancelTextColor: AppColors.primaryColor,
    //     contentPadding: EdgeInsets.all(12),
    //     textCancel: "kembali",
    //     textConfirm: "login",
    //     confirmTextColor: Colors.white,
    //     onCancel: () => Get.back(),
    //     onConfirm: toLoginPage,
    //     middleText: "Anda harus login terlebih dahulu",
    //   );
    // }
  }

  toLoginPage() async {
    if (isDisposed) return;
    Timer(const Duration(milliseconds: 300), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  onContact() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+6283871647864',
      text: "Hai, Saya ingin bertanya",
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
  }
}
