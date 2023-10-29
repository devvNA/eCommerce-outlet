// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../base/controllers/base_controller.dart';

class PaymentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  onTapOrder() async {
    await Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => Get.back());

    Get.find<BaseController>().changeScreen(2);
    Get.offNamed(Routes.BASE);
    notifyChildrens();
    update();
  }
}
