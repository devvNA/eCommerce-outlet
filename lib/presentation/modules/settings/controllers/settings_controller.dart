import 'package:get/get.dart';

import '../../../../core/firebase_auth_services.dart';
import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  FirebaseAuthService firebaseAuthService;

  SettingsController({required this.firebaseAuthService});


  Future<void> signOut() async {
    // Get.back();
    await firebaseAuthService.signOut();
    await Get.offAllNamed(Routes.SPLASH);
  }
}
