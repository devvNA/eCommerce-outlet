// ignore_for_file: unused_local_variable, unnecessary_overrides, unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/auth_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/auth_usecase.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';

import '../../../../../core/networking/firebase_auth_services.dart';
import '../../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final isGoogleTap = false.obs;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isTap = false.obs;
  final visible = true.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onGoogleSignIn() async {
    isGoogleTap.value = true;
    await FirebaseAuthServices.signInWithGoogle();
    // Get.snackbar("Sukses", "anda berhasil login",
    //     colorText: Colors.white, backgroundColor: AppColors.green1);
    isGoogleTap.value = false;
  }

  Future<void> onSignIn() async {
    isTap.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    if (emailController.text == "user@gmail.com" &&
        passwordController.text == "user12345") {
      Get.offAllNamed(Routes.BASE);
      Get.snackbar("Sukses", "anda berhasil login",
          colorText: Colors.white, backgroundColor: AppColors.green1);
    } else {
      Get.snackbar("Gagal", "email atau password salah",
          colorText: Colors.white, backgroundColor: Colors.red[500]);
    }
    isTap.value = false;
  }

  onDeleteBox() async {
    await box.erase();
    log(box.read("token") ?? "null");
  }

  // doLogin() async {
  //   bool isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     return true;
  //   }
  //   isTap.value = true;
  //   final isSuccess = await AuthUseCase(
  //           repository: AuthRepositoryImpl(
  //               remoteDataSource: AuthRemoteDataSourceImpl()))
  //       .login(email: emailController.text, password: passwordController.text);
  //   isSuccess.fold((l) {
  //     Get.snackbar("Gagal", "email atau password salah",
  //         colorText: Colors.white, backgroundColor: Colors.red[500]);
  //     log("Failed Login");
  //   }, (r) => Get.offAllNamed(Routes.BASE));

  //   isTap.value = false;
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
