import 'package:get/get.dart';

import '../../../../data/services/firebase_auth_services.dart';
import '../../../../data/services/network_request.dart';
import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Request>( Request());
    // Get.put<AuthRepository>(
    //     () => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.put<FirebaseAuthService>( FirebaseAuthServiceImpl());

    Get.put<SettingsController>(
     SettingsController(
          firebaseAuthService: Get.find<FirebaseAuthService>()),
    );
  }
}
