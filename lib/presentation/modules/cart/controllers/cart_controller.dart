import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';

class CartController extends GetxController {
  // to hold the products in cart
  List<ProductModel> products = [];

  // to hold the total price of the cart products
  num total = 0.0;

  @override
  void onInit() {
    getCartProducts();
    super.onInit();
  }

  /// when the user press on purchase now button
  onPurchaseNowPressed() {
    // ambil list semua produk
    var allProducts = DummyHelper.products;

// lakukan loop
    for (var product in allProducts) {
      // reset quantity jadi 0
      product.quantity = 0;
    }
    // kosongkan keranjang
    products.clear();

    // reset total harga
    total = 0;

    // reset quantity semua produk
    for (var product in DummyHelper.products) {
      product.quantity = 0;
    }

    // update UI
    // Get.find<BaseController>().changeScreen(0);
    notifyChildrens();
    update();
  }

  onRefreshCart() {
    products.clear();
    getCartProducts();
    update();
    
  }

  /// when the user press on increase button
  onIncreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = product.quantity! + 1;
    getCartProducts();
    update(['ProductQuantity']);
  }

  /// when the user press on decrease button
  onDecreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    if (product.quantity != 0) {
      product.quantity = product.quantity! - 1;
      getCartProducts();
      update(['ProductQuantity']);
    }
  }

  onInputQuantity(int productId, int quantity) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = quantity;
    getCartProducts();
    update(['ProductQuantity']);
  }

  /// when the user press on delete icon
  onDeletePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = 0;
    getCartProducts();
    update(['ProductQuantity']);
  }

  /// get the cart products from the product list
  getCartProducts() {
    products = DummyHelper.products.where((p) => p.quantity! > 0).toList();
    // calculate the total price
    total = products.fold<double>(0, (p, c) => p + c.price! * c.quantity!);
    update();
  }

  onEmptyCartPressed() {
    Get.find<BaseController>().changeScreen(0);
  }
}
