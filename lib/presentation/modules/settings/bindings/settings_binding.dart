import 'package:get/get.dart';

import '../../../../data/services/firebase_auth_services.dart';
import '../../../../data/services/network_request.dart';
import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginController>(
    //   () => LoginController(),
    // );
    Get.lazyPut<Request>(() => Request());
    // Get.lazyPut<AuthRepository>(
    //     () => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());

    Get.lazyPut<SettingsController>(
      () => SettingsController(
          firebaseAuthService: Get.find<FirebaseAuthService>()),
    );
  }
}
