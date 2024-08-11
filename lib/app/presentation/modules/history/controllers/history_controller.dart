// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/data/datasources/histori_pemesanan_datasource.dart';
import 'package:marvelindo_outlet/app/data/models/histori_pemesanan_model.dart';
import 'package:marvelindo_outlet/app/data/repositories/histori_pemesanan_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/histori_pemesanan.dart';

// controller
class HistoryController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  final loading = false.obs;
  final listHistoriPemesanan = <HistoriPemesanan>[].obs;
  final listHistoriProses = <HistoriPemesanan>[].obs;
  final listHistoriSelesai = <HistoriPemesanan>[].obs;
  final listHistoriDibatalkan = <HistoriPemesanan>[].obs;

  final tabs = [
    const Text("Proses"),
    const Text("Selesai"),
    const Text("Dibatalkan"),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoriPemesanan();
    changeStatus(0);
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void changeStatus(int index) {
    selectedIndex.value = index;
  }

  Future<void> getHistoriPemesanan() async {
    try {
      loading(true);
      var response = await HistoriPemesananUseCase(
              repository: HistoriPemesananRepositoryImpl(
                  remoteDataSource: HistoriPemesananRemoteDataSourceImpl()))
          .getListHistoriPemesanan();

      response.fold(
        (failure) => log("Error: ${failure.message}"),
        (data) {
          // Urutkan data berdasarkan ID transaksi terakhir
          data.sort((a, b) => b.id.compareTo(a.id));
          listHistoriPemesanan.value = data;
          filterHistoriPemesanan();
        },
      );
    } finally {
      loading(false);
    }
  }

  void filterHistoriPemesanan() {
    listHistoriProses.clear();
    listHistoriSelesai.clear();
    listHistoriDibatalkan.clear();

    for (var data in listHistoriPemesanan) {
      final status = data.status;
      if (status == 'proses') {
        listHistoriProses.add(data);
      } else if (status == 'selesai') {
        listHistoriSelesai.add(data);
      } else if (status == 'dibatalkan') {
        listHistoriDibatalkan.add(data);
      }
    }
  }

  onRefreshHistoriPemesanan() async {
    listHistoriPemesanan().clear();
    listHistoriProses().clear();
    listHistoriSelesai().clear();
    listHistoriDibatalkan().clear();
    getHistoriPemesanan();
  }
}
