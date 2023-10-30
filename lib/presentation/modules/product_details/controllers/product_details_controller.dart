import 'package:get/get.dart';
import 'package:marvelindo_outlet/core/types.dart';

import '../../../../data/models/product/products_model.dart';
import '../../../../utils/dummy_helper.dart';
import '../../base/controllers/base_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  // ProductModel product = Get.arguments;
  Products product = Get.arguments;

  Rx<ListProduct> products = Rx<ListProduct>([]);

  // for the product size
  var selectedSize = '';

  /// when the user press on add to cart button
  onAddToCartPressed() {
    // var mProduct = products.value.where((p) => p.id == product.id).first;
    var mProduct = DummyHelper.products.firstWhere((p) => p.id == product.id);

    mProduct.quantity = mProduct.quantity! + 1;
    Get.find<CartController>().getCartProducts();
    Get.back();
    Get.find<BaseController>().changeScreen(1);
    update();
  }

  /// change the selected size
  changeSelectedSize(String size) {
    if (size == selectedSize) return;
    selectedSize = size;
    update(['Size']);
  }
}
