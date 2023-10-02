import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/modules/auth/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
