// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

import '../../../../core/networking/firebase_auth_services.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    if (FirebaseAuthServices.isLoggedIn()) {
      Get.offNamed(Routes.BASE);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
    super.onInit();
  }
}
