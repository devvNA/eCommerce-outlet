// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/core/networking/firebase_auth_services.dart';
import 'package:marvelindo_outlet/app/data/models/outlet_model.dart';
import 'package:marvelindo_outlet/app/presentation/modules/cart/controllers/cart_controller.dart';

import '../../../../data/datasources/keranjang_remote_datasources.dart';
import '../../../../data/models/produk_model.dart';
import '../../../../data/repositories/keranjang_repository_impl.dart';
import '../../../../domain/usecase/keranjang_usecase.dart';
import '../../../global/theme/my_colors.dart';
import '../../base/controllers/base_controller.dart';
import '../../setting/controllers/setting_controller.dart';

class ProductDetailsController extends GetxController {
  Produk produk = Get.arguments;
  String? messageServer;
  final isExpanded = false.obs;
  final expansionTileKey = GlobalKey();
  var selectedSize = '';
  final box = GetStorage();

  @override
  void onInit() {
    box.write("user", Outlet);
    super.onInit();
  }

  Future onAddToCart() async {
    // final response = await KeranjangUseCase(
    //         repository: KeranjangRepositoryImpl(
    //             remoteDataSource: KeranjangRemoteDataSourceImpl()))
    //     .addToCart(idOutlet: 3, produk: produk);
    // // .addToCart(idOutlet: UserManager().currentOutlet!.id!, produk: produk);
    // response.fold((failure) => messageServer = failure.message,
    //     (message) => messageServer = message);
    // Get.back();
    // await Future.delayed(const Duration(milliseconds: 250));
    // Get.find<BaseController>().changeScreen(1);
    // Get.find<CartController>().onRefreshKeranjang();

    if (FirebaseAuthServices.isLoggedIn()) {
      // final response = await KeranjangUseCase(
      //         repository: KeranjangRepositoryImpl(
      //             remoteDataSource: KeranjangRemoteDataSourceImpl()))
      //     .addToCart(id: FirebaseAuthServices.getUID(), produk: produk);
      final response = await KeranjangUseCase(
              repository: KeranjangRepositoryImpl(
                  remoteDataSource: KeranjangRemoteDataSourceImpl()))
          .addToCart(
        // idOutlet: UserManager().currentOutlet!.id!,
        idOutlet: FirebaseAuthServices.getUID(),
        produk: produk,
      );
      response.fold((failure) => messageServer = failure.message,
          (message) => messageServer = message);
      Get.back();
      await Future.delayed(const Duration(milliseconds: 250));
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
        onConfirm: () => Get.find<SettingController>().toLoginPage(),
        middleText: "Anda harus verifikasi terlebih dahulu",
      );
    }
    return messageServer;
  }

  scrollToSelectedContent() {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        Scrollable.ensureVisible(keyContext,
            duration: const Duration(milliseconds: 200));
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
