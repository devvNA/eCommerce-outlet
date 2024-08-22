// ignore_for_file: unused_local_variable, unnecessary_overrides
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../data/datasources/auth_remote_datasources.dart';
import '../../../../../data/repositories/auth_repository_impl.dart';
import '../../../../../domain/usecase/auth_usecase.dart';
import '../../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final isGoogleTap = false.obs;
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isTap = false.obs;
  final visible = true.obs;
  final box = GetStorage();

  @override
  void onInit() {
    rememberMe.value = box.read('REMEMBER_ME') ?? false;
    emailController.text = box.read('REMEMBER_ME_EMAIL') ?? "";
    passwordController.text = box.read('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }

  Future<void> onSignIn() async {
    isTap(true);
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offAllNamed(Routes.BASE);
    isTap(false);
  }

  Future doLogin() async {
    isTap(true);

    bool isValid = formField.currentState!.validate();
    if (!isValid) {
      return true;
    }
    // save data if Ingat Saya is selected
    if (rememberMe.value) {
      box.write('REMEMBER_ME', rememberMe.value);
      box.write('REMEMBER_ME_EMAIL', emailController.text.trim());
      box.write('REMEMBER_ME_PASSWORD', passwordController.text.trim());
    } else {
      box.remove('REMEMBER_ME_EMAIL');
      box.remove('REMEMBER_ME_PASSWORD');
      box.remove('REMEMBER_ME');
    }
    final isSuccess = await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    isSuccess.fold((failure) {
      Get.snackbar("Gagal", "Email atau password salah",
          colorText: Colors.white, backgroundColor: Colors.red[500]);
      log("Failed Login");
    }, (data) async {
      //User
      await UserManager().loadUserData();
      return Get.offAllNamed(Routes.BASE);
    });

    isTap(false);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
