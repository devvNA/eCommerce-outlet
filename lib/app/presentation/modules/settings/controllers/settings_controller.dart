import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/networking/firebase_auth_services.dart';
import '../../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  FirebaseAuthService firebaseAuthService;

  SettingsController({required this.firebaseAuthService});

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    final box = GetStorage();
    box.remove("accessToken");

    await Get.offAllNamed(Routes.SPLASH);
  }
}
