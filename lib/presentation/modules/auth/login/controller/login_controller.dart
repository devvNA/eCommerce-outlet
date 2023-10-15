// ignore_for_file: unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/services/firebase_auth_services.dart';


class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;

  LoginController({required this.firebaseAuthService});

  Future<void> onGoogleSignIn() async {
    await firebaseAuthService.signInWithGoogle();
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
