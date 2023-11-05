import 'dart:developer';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/cart/controllers/cart_controller.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

import '../../../../core/types.dart';
import '../../../../data/models/product/produk_model.dart';
import '../../../../utils/dummy_helper.dart';
import '../../base/controllers/base_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  // ProductModel product = Get.arguments;
  Produk product = Get.arguments;

  Rx<List> products = Rx([]);

  // for the product size
  var selectedSize = '';

  Rx<ListProduk> cartList = Rx<ListProduk>([]);

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
}
