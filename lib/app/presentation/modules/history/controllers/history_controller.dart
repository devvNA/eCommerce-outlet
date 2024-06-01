// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/datasources/histori_pemesanan_datasource.dart';
import '../../../../data/models/histori_pemesanan_model.dart';
import '../../../../data/repositories/histori_pemesanan_repository_impl.dart';
import '../../../../domain/usecase/histori_pemesanan.dart';

// controller
class HistoryController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  final loading = false.obs;
  final listHistoriPemesanan = <HistoriPemesanan>[].obs;

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

  getHistoriPemesanan() async {
    loading(true);

    var response = await HistoriPemesananUseCase(
            repository: HistoriPemesananRepositoryImpl(
                remoteDataSource: HistoriPemesananRemoteDataSourceImpl()))
        .getListHistoriPemesanan();

    response.fold((failure) => log("Error: ${failure.message}"),
        (historiPemesanan) => listHistoriPemesanan(historiPemesanan));

    loading(false);
  }

    onRefreshHistoriPemesanan() async {
    listHistoriPemesanan().clear();
    getHistoriPemesanan();
  }
}
