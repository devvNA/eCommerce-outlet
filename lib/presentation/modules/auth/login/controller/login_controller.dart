// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../data/services/firebase_auth_services.dart';
import '../../../../routes/app_pages.dart';

// import '../../../../../data/models/product_model.dart';

class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;

  LoginController({required this.firebaseAuthService});

  Future<void> onGoogleSignIn() async {
    User? user = await firebaseAuthService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    await Get.offAllNamed(Routes.SPLASH);
  }
}
