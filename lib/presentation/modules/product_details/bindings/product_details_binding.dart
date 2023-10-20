import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/base/controllers/base_controller.dart';

import '../../cart/controllers/cart_controller.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductDetailsController>(
      ProductDetailsController(),
    );
    Get.put<CartController>(
       CartController(),
    );
    Get.put<BaseController>(
       BaseController(),
    );
  }
}
