import 'dart:developer';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/datasources/keranjang_remote_datasources.dart';
import 'package:marvelindo_outlet/data/models/keranjang/keranjang_model.dart';
import 'package:marvelindo_outlet/data/models/produk/produk_model.dart';
import 'package:marvelindo_outlet/data/repositories/keranjang_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/keranjang_usecase.dart';

import '../../../../core/utils/helpers/dummy_helper.dart';
import '../../base/controllers/base_controller.dart';

class CartController extends GetxController {
  // to hold the products in cart
  final listKeranjang = <Keranjang>[].obs;
  final produkList = <Produk>[].obs;
  var loading = false.obs;

  // RxList<ProductModel> products = RxList<ProductModel>([]);

  // to hold the total price of the cart products
  num total = 0.0;

  @override
  void onInit() {
    // getCartProducts();
    getKeranjang();
    super.onInit();
  }

  // get the cart products from the product list

  // getCartProducts() {
  //   products = DummyHelper.products.where((p) => p.quantity! > 0).toList();
  //   // calculate the total price
  //   total = products.fold<double>(0, (p, c) => p + c.price! * c.quantity!);
  //   update();
  // }

  getKeranjang() async {
    var response = await KeranjangUseCase(
            repository: KeranjangRepositoryImpl(
                remoteDataSource: KeranjangRemoteDataSourceImpl()))
        .getListKeranjang();
    response.fold((failure) => log("Error: ${failure.message}"),
        (keranjang) => listKeranjang(keranjang));
  }

  String getNamaProduk(int produkId) {
    final produk = produkList.firstWhere((produk) => produk.id == produkId,
        orElse: () =>
            const Produk(id: 0, nama: "Produk tidak ditemukan", harga: 0));
    return produk.nama;
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
    listKeranjang.clear();

    // reset total harga
    total = 0;

    // reset quantity semua produk
    for (var product in DummyHelper.products) {
      product.quantity = 0;
    }
    update();
  }

  onRefreshCart() {
    listKeranjang.clear();
    // getCartProducts();
  }

  // when the user press on increase button
  onIncreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = product.quantity! + 1;
    // getCartProducts();
    // update(['ProductQuantity']);
  }

  //  when the user press on decrease button
  onDecreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    if (product.quantity! > 1) {
      product.quantity = product.quantity! - 1;
      // getCartProducts();
      // update(['ProductQuantity']);
    }
  }

  onInputQuantity(int productId, int quantity) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = quantity;
    // getCartProducts();
    // update(['ProductQuantity']);
  }

  /// when the user press on delete icon
  onDeletePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = 0;
    // getCartProducts();
    // update(['ProductQuantity']);
  }

  onEmptyCartPressed() {
    Get.find<BaseController>().changeScreen(0);
  }
}
