import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/networking/firebase_auth_services.dart';
import 'package:marvelindo_outlet/app/data/datasources/produk_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/produk_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/produk_usecase.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/custom_snackbar.dart';
import 'package:marvelindo_outlet/app/presentation/modules/cart/controllers/cart_controller.dart';
import 'package:marvelindo_outlet/app/presentation/modules/settings/controllers/settings_controller.dart';
import '../../../../data/models/produk/produk_model.dart';
import '../../../global/theme/my_colors.dart';
import '../../base/controllers/base_controller.dart';

class ProductDetailsController extends GetxController {
  final firebaseAuth = FirebaseAuthServiceImpl();
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

  onAddToCart(final context) async {
    if (firebaseAuth.isLoggedIn()) {
      ProdukUseCase(
              repository: ProdukRepositoryImpl(
                  remoteDataSource: ProdukRemoteDataSourceImpl()))
          .addToCart(produk: produk)
          .then((value) => CustomSnackBar.showCustomSuccessSnackBar(
              title: "Sukses", message: "Produk berhasil ditambahkan"));
      Get.back();
      await Future.delayed(const Duration(milliseconds: 300));
      Get.find<BaseController>().changeScreen(1);
      Get.find<CartController>().onRefreshKeranjang();
    } else {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 13),
        buttonColor: AppColors.primaryColor,
        cancelTextColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.all(12),
        textCancel: "kembali",
        textConfirm: "login",
        confirmTextColor: Colors.white,
        onConfirm: () => Get.find<SettingsController>().toLoginPage(),
        middleText: "Anda harus login terlebih dahulu",
      );
    }
  }
}
