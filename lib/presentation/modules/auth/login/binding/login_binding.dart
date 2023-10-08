import 'package:get/get.dart';

import '../../../../../data/services/firebase_auth_services.dart';
import '../../../../../data/services/network_request.dart';
import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginController>(
    //   () => LoginController(),
    // );
    Get.lazyPut<Request>(() => Request());
    // Get.lazyPut<AuthRepository>(
    //     () => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());

    Get.lazyPut(() =>
        LoginController(firebaseAuthService: Get.find<FirebaseAuthService>()));
  }
}
