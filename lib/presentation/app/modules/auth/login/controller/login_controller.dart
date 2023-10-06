import 'package:get/get.dart';

import '../../../../../../data/models/product_model.dart';

class LoginController extends GetxController {
  // get product details from arguments
  ProductModel product = Get.arguments;

  // for the product size
  var selectedSize = '';
}
