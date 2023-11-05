// ignore_for_file: avoid_print, override_on_non_overriding_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/core/types.dart';
import 'package:marvelindo_outlet/data/datasources/book%20_remote_datasources.dartbook_remote_data_source.dart';
import 'package:marvelindo_outlet/data/datasources/products_remote_datasources.dart';
import 'package:marvelindo_outlet/data/repositories/book_repository_impl.dart';
import 'package:marvelindo_outlet/data/repositories/product_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/book_usecase.dart';

import '../../../domain/usecase/product_usecase.dart';

class ApiTestController extends GetxController {
  ApiTestController();

  RxList products = RxList([]);
  Rx<ListProduk> listProduk = Rx<ListProduk>([]);
  Rx<ListBook> listBooks = Rx<ListBook>([]);
  RxBool loading = RxBool(false);
  // Map? selectedItems;
  RxInt currIndex = RxInt(0);

  RxList categories = RxList([
    "semua",
    "perdana",
    "voucher",
  ]);

  final int _limit = 5;
  int _page = 1;
  bool hasMore = true;

  final ScrollController scrollController = ScrollController();

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll && hasMore) {
      getListBook();
    }
  }

  @override
  void onInit() {
    // scrollController.addListener(
    //   () {
    //     onScroll();
    //   },
    // );
    super.onInit();
    // getListProduct();
    getListProductByCategory(categories[currIndex.value]);
    // getListBook();
  }

  onChangeCategory(index) {
    currIndex(index);
    log(categories[index].toString());
    onRefresh();
    update();
  }

  // Future getListProduct() async {
  //   try {
  //     Either<Failure, ListProduct> response =
  //         await productUseCase.getListProduct();

  //     response;
  //     notifyChildrens();
  //     update();
  //   } on Exception {
  //     rethrow;
  //   }
  // }

  Future getListBook() async {
    var response = await BookUseCase(
            repository: BookRepositoryImpl(
                remoteDataSource: BookRemoteDataSourceImpl()))
        .getListBook(_page, _limit);
    if (response.length() < _limit) {
      hasMore = false;
    }
    response.fold(
      (failure) {
        print('Error: ${failure.message}');
      },
      (books) {
        _page++;
        listBooks.value = books;
      },
    );
    update();
  }

  // Future getListProduct() async {
  //   var response = await ProductUseCase(
  //           repository: ProductRepositoryImpl(
  //               remoteDataSource: ProductRemoteDataSourceImpl()))
  //       .getListProduct();

  //   response.fold(
  //     (failure) {
  //       print('Error: ${failure.message}');
  //     },
  //     (products) {
  //       listProducts.value = products;
  //     },
  //   );
  //   update();
  // }

  Future onRefresh() async {
    // listBooks.value.clear();
    // getListBook();
    // listProducts.value.clear();
    // getListProduct();
    listProduk.value.clear();
    getListProductByCategory(categories[currIndex.value]);
    update();
  }

  Future getListProductByCategory(String kategori) async {
    loading(true);

    var response = await ProductUseCase(
            repository: ProductRepositoryImpl(
                remoteDataSource: ProductRemoteDataSourceImpl()))
        .getListProductByCategory(kategori);

    response.fold(
      (failure) {
        log('Error: ${failure.message}');
      },
      (products) {
        listProduk.value = products;
      },
    );
    loading(false);
    update();
  }

  // Future getListProduct() async {
  //       var products = await ProductUseCase(
  //           repository: ProductRepositoryImpl(
  //               remoteDataSource: ProductRemoteDataSourceImpl()))
  //       .getListProduct();

  //   products.fold((failure) {
  //     // Jika terjadi error, bisa di-handle sesuai kebutuhan
  //     // Misalnya, menampilkan pesan error atau melakukan aksi lain
  //     // Get.snackbar('Error', failure.message,
  //     //     backgroundColor: const Color.fromARGB(255, 226, 53, 41),
  //     //     colorText: Colors.white,
  //     //     duration: const Duration(seconds: 2));

  //     debugPrint('Error: ${failure.message}');
  //   }, (products) {

  //   });
  // }
}
