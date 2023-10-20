import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  void onSubmit() {
    Get.offNamed(Routes.LOGIN);
  }
}
