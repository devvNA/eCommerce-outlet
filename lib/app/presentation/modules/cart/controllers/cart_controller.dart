// ignore_for_file: unused_local_variable, unnecessary_overrides

import 'dart:developer';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/debouncer.dart';
import 'package:marvelindo_outlet/app/data/datasources/keranjang_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang/keranjang_model.dart';
import 'package:marvelindo_outlet/app/data/repositories/keranjang_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/keranjang_usecase.dart';

import '../../base/controllers/base_controller.dart';

class CartController extends GetxController {
  final debounceC = DebouncerC(duration: const Duration(milliseconds: 1200));
  final listKeranjang = <Keranjang>[].obs;
  // to hold the products in cart
  final loading = false.obs;

  String? messageDelete;

  // final products = <Produk>[].obs;
  // RxList<ProductModel> products = RxList<ProductModel>([]);

  @override
  void onInit() {
    super.onInit();
    // getCartProducts();
    getKeranjang();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increaseQuantity(int index, int productId) {
    listKeranjang[index].quantity = listKeranjang[index].quantity! + 1;
    listKeranjang.refresh();
    debounceC.run(() {
    log(listKeranjang[index].quantity!.toString());
      onInputItemCart(productId, listKeranjang[index].quantity!);
    });
  }

  void decreaseQuantity(int index, int productId) {
    if (listKeranjang[index].quantity! > 1) {
      listKeranjang[index].quantity = listKeranjang[index].quantity! - 1;
      listKeranjang.refresh();
      log(listKeranjang[index].quantity!.toString());
      debounceC.run(() {
        onInputItemCart(productId, listKeranjang[index].quantity!);
      });
    }
  }

  getKeranjang() async {
    loading(true);

    var response = await KeranjangUseCase(
            repository: KeranjangRepositoryImpl(
                remoteDataSource: KeranjangRemoteDataSourceImpl()))
        .getListKeranjang();

    response.fold((failure) => log("Error: ${failure.message}"),
        (keranjang) => listKeranjang(keranjang));

    loading(false);
  }

  // // when the user press on increase button
  // onIncreasePressed(int productId) {
  //   var product = listKeranjang.firstWhere((p) => p.id == productId);
  //   product.quantity = product.quantity! + 1;
  //   // getCartProducts();
  //   // update(['ProductQuantity']);
  // }

  onRefreshKeranjang() async {
    listKeranjang().clear();
    getKeranjang();
    // final response = await KeranjangUseCase(
    //         repository: KeranjangRepositoryImpl(
    //             remoteDataSource: KeranjangRemoteDataSourceImpl()))
    //     .getListKeranjang();

    // response.fold((failure) => log("Error: ${failure.message}"),
    //     (keranjang) => listKeranjang(keranjang));
  }

  // onIncreasePressed(int productId) {
  //   var product = DummyHelper.products.firstWhere((p) => p.id == productId);
  //   product.quantity = product.quantity! + 1;
  //   // getCartProducts();
  //   // update(['ProductQuantity']);
  // }

  // //  when the user press on decrease button
  // onDecreasePressed(int productId) {
  //   var product = DummyHelper.products.firstWhere((p) => p.id == productId);
  //   if (product.quantity! > 1) {
  //     product.quantity = product.quantity! - 1;
  //     // getCartProducts();
  //     // update(['ProductQuantity']);
  //   }
  // }

  // onInputQuantity(int productId, int quantity) {
  //   var product = DummyHelper.products.firstWhere((p) => p.id == productId);
  //   product.quantity = quantity;
  //   // getCartProducts();
  //   // update(['ProductQuantity']);
  // }

  onEmptyCartPressed() {
    Get.find<BaseController>().changeScreen(0);
  }

  /// when the user press on delete icon
  onDeletePressed(int productId) async {
    var response = await KeranjangUseCase(
            repository: KeranjangRepositoryImpl(
                remoteDataSource: KeranjangRemoteDataSourceImpl()))
        .deleteProdukKeranjang(productId);
    response.fold((failure) => messageDelete = failure.message,
        (message) => messageDelete = message);
    onRefreshKeranjang();
  }

  onInputItemCart(int productId, int qty) async {
    final response = await KeranjangUseCase(
            repository: KeranjangRepositoryImpl(
                remoteDataSource: KeranjangRemoteDataSourceImpl()))
        .updateItemKeranjang(productId, qty);
    response.fold((failure) => log(failure.message), (message) => log(message));
    return response;
  }

  // onIncreasePressed(int productId, int currQty) async {
  //   final response = await KeranjangUseCase(
  //           repository: KeranjangRepositoryImpl(
  //               remoteDataSource: KeranjangRemoteDataSourceImpl()))
  //       .increaseItemKeranjang(productId, currQty);
  //   response.fold((failure) => log(failure.message), (message) => log(message));
  //   return response;
  // }

  // onDecreasePressed(int productId, int currQty) async {
  //   final response = await KeranjangUseCase(
  //           repository: KeranjangRepositoryImpl(
  //               remoteDataSource: KeranjangRemoteDataSourceImpl()))
  //       .decreaseItemKeranjang(productId, currQty);
  //   response.fold((failure) => log(failure.message), (message) => log(message));
  //   return response;
  // }

  int totalPayment() {
    int totalPembayaran = 0;
    for (var produk in listKeranjang) {
      totalPembayaran += produk.hargaBarang! * produk.quantity!;
    }
    return totalPembayaran;
  }
}
