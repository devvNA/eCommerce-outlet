import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/base/controllers/base_controller.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(
      CartController(),
    );
    Get.put<BaseController>(
      BaseController(),
    );
  }
}
