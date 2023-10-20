import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/services/firebase_auth_services.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(),
    );
    Get.put<FirebaseAuthService>(FirebaseAuthServiceImpl());
  }
}
