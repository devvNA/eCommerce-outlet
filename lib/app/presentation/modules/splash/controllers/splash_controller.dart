// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';

import '../../../../core/networking/firebase_auth_services.dart';
import '../../../../routes/app_pages.dart';

class SplashController extends GetxController {
  FirebaseAuthService firebaseAuth;

  SplashController({required this.firebaseAuth});

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    if (firebaseAuth.isLoggedIn()) {
      Get.offNamed(Routes.BASE);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
    super.onInit();
  }
}
