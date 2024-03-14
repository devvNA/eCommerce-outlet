import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/datasources/produk_remote_datasources.dart';
import 'package:marvelindo_outlet/data/repositories/produk_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/produk_usecase.dart';
import '../../../../data/models/produk/produk_model.dart';
import '../../base/controllers/base_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  // ProductModel product = Get.arguments;
  Produk produk = Get.arguments;
  // final products = Rx([]);

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

  onAddToCart(final context) {
    ProdukUseCase(
            repository: ProdukRepositoryImpl(
                remoteDataSource: ProdukRemoteDataSourceImpl()))
        .addToCart(produk: produk);
    Get.back();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Produk berhasil ditambahkan',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                )),
        backgroundColor: Colors.green,
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 200,
            left: 15,
            right: 15)));

    Get.find<BaseController>().changeScreen(1);
  }
}
