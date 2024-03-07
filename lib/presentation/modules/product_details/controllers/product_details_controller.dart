import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/core/utils/api_endpoints.dart';
import 'package:marvelindo_outlet/data/datasources/products_remote_datasources.dart';
import 'package:marvelindo_outlet/data/repositories/product_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/product_usecase.dart';
import 'package:marvelindo_outlet/presentation/modules/cart/controllers/cart_controller.dart';
import '../../../../core/utils/helpers/dummy_helper.dart';
import '../../../../data/models/produk/produk_model.dart';
import '../../base/controllers/base_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  // ProductModel product = Get.arguments;
  Produk product = Get.arguments;
  // Rx<List> products = Rx([]);

  // for the product size
  var selectedSize = '';

  /// when the user press on add to cart button
  // onAddToCartPressed() {
  //   // var mProduct = products.value.where((p) => p.id == product.id).first;
  //   var mProduct = DummyHelper.products.firstWhere((p) => p.id == product.id);

  //   mProduct.quantity = mProduct.quantity! + 1;
  //   // Get.find<CartController>().getCartProducts();
  //   Get.back();
  //   Get.find<BaseController>().changeScreen(1);
  //   update();
  // }

  onAddToCart() {
    ProductUseCase(
            repository: ProductRepositoryImpl(
                remoteDataSource: ProductRemoteDataSourceImpl()))
        .addToCart(produk: product);
    Get.back();
    Get.find<BaseController>().changeScreen(1);
  }
}

//"id": 1,
//"id_user": 1,
//"id_produk": 2,
//"quantity": 1