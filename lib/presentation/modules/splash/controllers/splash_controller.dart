import 'package:get/get.dart';

import '../../../global/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offNamed(Routes.LOGIN);
    super.onInit();
  }
}
