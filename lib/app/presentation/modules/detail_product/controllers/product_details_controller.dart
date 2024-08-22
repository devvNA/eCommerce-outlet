import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/datasources/produk_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/produk_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/produk_usecase.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/custom_snackbar.dart';
import 'package:marvelindo_outlet/app/presentation/modules/cart/controllers/cart_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../../data/models/produk_model.dart';
import '../../base/controllers/base_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  // ProductModel product = Get.arguments;
  Produk produk = Get.arguments;
  String? messageServer;
  final isExpanded = false.obs;
  final expansionTileKey = GlobalKey();
  final outletAuth = UserManager().currentOutlet;
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

  @override
  void onInit() {
    super.onInit();
  }

  onAddToCart() async {
    if (UserManager.isVerified() != "terverifikasi") {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 13),
        buttonColor: AppColors.primaryColor,
        cancelTextColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.all(16),
        textCancel: "kembali",
        textConfirm: "verifikasi",
        confirmTextColor: Colors.white,
        onConfirm: () => onVerifikasi(),
        middleText: "Anda harus verifikasi terlebih dahulu",
      );
    } else {
      var response = await ProdukUseCase(
              repository: ProdukRepositoryImpl(
                  remoteDataSource: ProdukRemoteDataSourceImpl()))
          .addToCart(idUser: outletAuth!.id, produk: produk);
      response.fold((failure) {
        CustomSnackBar.showCustomErrorSnackBar(
            title: "Gagal",
            message: failure.message,
            duration: const Duration(milliseconds: 1200));
      }, (message) {
        Get.back();
        CustomSnackBar.showCustomSuccessSnackBar(
            title: "Sukses",
            message: message,
            duration: const Duration(milliseconds: 1200));
        Future.delayed(const Duration(milliseconds: 200));
        Get.find<BaseController>().changeScreen(1);
        Get.find<CartController>().onRefreshKeranjang();
      });
    }
  }

  onVerifikasi() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+6283871647864',
      text:
          "Hai, Saya ingin melakukan verifikasi akun. \n\nNama Outlet : ${outletAuth!.namaOutlet} \nNama Pemilik : ${outletAuth!.email} \nAlamat : ${outletAuth!.alamat}",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launchUrlString" method is part of "url_launcher_string".
    await launchUrlString('$link');
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
