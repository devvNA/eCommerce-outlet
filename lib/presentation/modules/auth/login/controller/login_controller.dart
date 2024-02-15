// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';
import '../../../../../core/networking/firebase_auth_services.dart';

class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final isGoogleTap = false.obs;
  final formField = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isTap = false.obs;
  final visible = true.obs;
  final regex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$').obs;

  LoginController({required this.firebaseAuthService});

  Future<void> onGoogleSignIn() async {
    isGoogleTap.value = true;
    await firebaseAuthService.signInWithGoogle();
    isGoogleTap.value = false;
  }

  Future<void> onSignIn() async {
    isTap.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offAllNamed(Routes.BASE);
    isTap.value = false;
  }
}
