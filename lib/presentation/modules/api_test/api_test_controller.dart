// ignore_for_file: avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/types.dart';
import 'package:marvelindo_outlet/domain/usecase/book_usecase.dart';

import '../../../domain/usecase/product_usecase.dart';

class ApiTestController extends GetxController {
  final listProducts = Rx<ListProduct>([]);
  final listBooks = Rx<ListBook>([]);

  final int _limit = 5;
  int _page = 1;
  bool hasMore = true;

  ProductUseCase productUseCase;
  BookUseCase bookUseCase;

  ApiTestController({required this.productUseCase, required this.bookUseCase});

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
    scrollController.addListener(
      () {
        onScroll();
      },
    );
    super.onInit();
    getListProduct();
    // getListBook();
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
    var response = await bookUseCase.getListBook(_page, _limit);
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
    notifyChildrens();
    update();
  }

  Future getListProduct() async {
    var response = await productUseCase.getListProduct();

    response.fold(
      (failure) {
        print('Error: ${failure.message}');
      },
      (products) {
        _page++;
        listProducts.value = products;
      },
    );
    notifyChildrens();
    update();
  }

  Future onRefresh() async {
    // listBooks.value.clear();
    // getListBook();
    listProducts.value.clear();
    getListProduct();
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
