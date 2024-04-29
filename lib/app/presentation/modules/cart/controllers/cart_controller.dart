import 'dart:developer';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/debouncer.dart';
import 'package:marvelindo_outlet/app/data/datasources/keranjang_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang/keranjang_model.dart';
import 'package:marvelindo_outlet/app/data/repositories/keranjang_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/keranjang_usecase.dart';

import '../../../../core/utils/helpers/dummy_helper.dart';
import '../../base/controllers/base_controller.dart';

class CartController extends GetxController {
  final debounceC = DebouncerC(duration: const Duration(seconds: 1));
  final listKeranjang = <Keranjang>[].obs;
  // to hold the products in cart

  final loading = false.obs;

  String? messageDelete;
  // final products = <Produk>[].obs;
  // RxList<ProductModel> products = RxList<ProductModel>([]);

  // to hold the total price of the cart products
  num total = 0.0;

  @override
  void onInit() {
    // getCartProducts();
    getKeranjang();
    super.onInit();
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

  //when the user press on purchase now button
  onPurchaseNowPressed() {
    // ambil list semua produk
    var allProducts = DummyHelper.products;

    // lakukan loop
    for (var product in allProducts) {
      // reset quantity jadi 0
      product.quantity = 0;
    }
    // kosongkan keranjang
    // listKeranjang.clear();

    // reset total harga
    total = 0;

    // reset quantity semua produk
    for (var product in DummyHelper.products) {
      product.quantity = 0;
    }
    update();
  }

  // // when the user press on increase button
  // onIncreasePressed(int productId) {
  //   var product = listKeranjang.firstWhere((p) => p.id == productId);
  //   product.quantity = product.quantity! + 1;
  //   // getCartProducts();
  //   // update(['ProductQuantity']);
  // }

  onRefreshKeranjang() {
    listKeranjang().clear();
    getKeranjang();
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

  onEmptyCartPressed() {
    Get.find<BaseController>().changeScreen(0);
  }

  onInputItemCart(int productId, int qty) async {
    final response = await KeranjangUseCase(
            repository: KeranjangRepositoryImpl(
                remoteDataSource: KeranjangRemoteDataSourceImpl()))
        .updateItemKeranjang(productId, qty);
    response.fold((failure) => log(failure.message), (message) => log(message));
    return response;
  }

  onIncreasePressed(int productId, int currQty) async {
    final response = await KeranjangUseCase(
            repository: KeranjangRepositoryImpl(
                remoteDataSource: KeranjangRemoteDataSourceImpl()))
        .increaseItemKeranjang(productId, currQty);
    response.fold((failure) => log(failure.message), (message) => log(message));
    return response;
  }

  onDecreasePressed(int productId, int currQty) async {
    final response = await KeranjangUseCase(
            repository: KeranjangRepositoryImpl(
                remoteDataSource: KeranjangRemoteDataSourceImpl()))
        .decreaseItemKeranjang(productId, currQty);
    response.fold((failure) => log(failure.message), (message) => log(message));
    return response;
  }
}
