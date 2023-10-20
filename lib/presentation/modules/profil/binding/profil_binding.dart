import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/settings/controllers/settings_controller.dart';

import '../../../../data/services/firebase_auth_services.dart';
import '../controllers/profil_controller.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfilController>(
      ProfilController(),
    );
    Get.put<FirebaseAuthService>( FirebaseAuthServiceImpl());
    Get.put<SettingsController>(
       SettingsController(
          firebaseAuthService: Get.find<FirebaseAuthService>()),
    );
  }
}
