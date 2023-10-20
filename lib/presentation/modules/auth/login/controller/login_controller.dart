// ignore_for_file: unused_local_variable


import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

import '../../../../../data/services/firebase_auth_services.dart';

class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  bool isTap = false;
  bool isGoogleTap = false;

  LoginController({required this.firebaseAuthService});

  Future<void> onGoogleSignIn() async {
    isGoogleTap = true;
    update();
    await firebaseAuthService.signInWithGoogle();
  }

  Future<void> onSignIn() async {
    isTap = true;
    update();
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offAllNamed(Routes.BASE);
  }

  Future<void> onFacebookSignIn() async {
    await firebaseAuthService.signInWithFacebook();
    try {} on Exception catch (err) {
      if (kDebugMode) {
        debugPrint(err as String?);
      }
    }
  }
}
