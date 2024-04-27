// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/networking/firebase_auth_services.dart';
import '../../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final isGoogleTap = false.obs;
  final formField = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isTap = false.obs;
  final visible = true.obs;

  Future<void> onGoogleSignIn() async {
    isGoogleTap.value = true;
    await FirebaseAuthServices.signInWithGoogle();
    isGoogleTap.value = false;
  }

  Future<void> onSignIn() async {
    isTap.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offAllNamed(Routes.BASE);
    isTap.value = false;
  }
}
