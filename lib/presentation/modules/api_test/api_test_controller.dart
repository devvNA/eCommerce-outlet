// ignore_for_file: avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/datasources/book%20_remote_datasources.dartbook_remote_data_source.dart';
import 'package:marvelindo_outlet/data/repositories/book_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/book_usecase.dart';

import '../../../core/utils/types.dart';

class ApiTestController extends GetxController {
  Rx<ListBook> listBooks = Rx<ListBook>([]);
  RxBool loading = RxBool(false);
  RxInt currIndex = RxInt(0);

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
    // getListBook();
  }

  onChangeCategory(index) {
    currIndex(index);
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

  Future onRefresh() async {
    listBooks.value.clear();
    getListBook();
    update();
  }
}
