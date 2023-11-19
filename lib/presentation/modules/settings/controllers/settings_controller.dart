import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/firebase_auth_services.dart';
import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  FirebaseAuthService firebaseAuthService;

  SettingsController({required this.firebaseAuthService});

  Future<void> signOut() async {
    // Get.back();
    await firebaseAuthService.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");

    await Get.offAllNamed(Routes.SPLASH);
  }
}
