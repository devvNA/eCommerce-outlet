// ignore_for_file: avoid_print, override_on_non_overriding_member, unused_field
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiTestController extends GetxController {
  final loading = false.obs;
  final isVerified = false.obs;
  RxInt currIndex = RxInt(0);
  final int _limit = 5;
  final int _page = 1;
  bool hasMore = true;

  final ScrollController scrollController = ScrollController();

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll && hasMore) {
      // getListBook();
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
    // getListBook();
  }

  onChangeCategory(index) {
    currIndex(index);
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

  // Future getListBook() async {
  //   var response = await BookUseCase(
  //           repository: BookRepositoryImpl(
  //               remoteDataSource: BookRemoteDataSourceImpl()))
  //       .getListBook(_page, _limit);
  //   if (response.length() < _limit) {
  //     hasMore = false;
  //   }
  //   response.fold(
  //     (failure) {
  //       print('Error: ${failure.message}');
  //     },
  //     (books) {
  //       _page++;
  //       listBooks.value = books;
  //     },
  //   );
  //   update();
  // }


  isAccVerified() {
    isVerified(!isVerified.value);
    log(isVerified.toString());
  }
}
