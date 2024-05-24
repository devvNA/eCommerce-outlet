// ignore_for_file: unnecessary_overrides, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marvelindo_outlet/app/core/networking/firebase_auth_services.dart';
import 'package:marvelindo_outlet/app/data/datasources/transaksi_remote_datasource.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang/keranjang_model.dart';
import 'package:marvelindo_outlet/app/data/repositories/transaksi_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/transaksi_usecase.dart';

import '../../base/controllers/base_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class CheckoutController extends GetxController {
  late TextEditingController alamatController;
  List<Keranjang> checkoutProduk =
      Get.arguments; //Menampung data kiriman halaman keranjang

  final isButtonActive = false.obs;
  String? selectedPayment;

  @override
  void onInit() {
    super.onInit();
    alamatController = TextEditingController(
      text:
          "Jl. DI Panjaitan No.128, Karangreja, Purwokerto Kidul, Kec. Purwokerto Selatan, Kabupaten Banyumas, Jawa Tengah 53147",
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  List<DropdownMenuItem<String>> get paymentDropDownItems {
    List<DropdownMenuItem<String>> paymentItems = [
      const DropdownMenuItem(value: "COD", child: Text("COD")),
      const DropdownMenuItem(value: "Transfer", child: Text("Transfer")),
    ];
    return paymentItems;
  }

  onSelectedPayment(String paymentChoice) {
    selectedPayment = paymentChoice;
    isButtonActive.value = paymentChoice.isNotEmpty;
    update();
    log(paymentChoice);
  }

  onTapOrder() async {
    // selectedPayment = null;
    // isButtonActive.value = false;
    // Get.find<CartController>().onPurchaseNowPressed();
    await Future.delayed(const Duration(milliseconds: 1200))
        .then((value) => Get.back());
    Get.back();
    Get.find<BaseController>().changeScreen(2);
    Get.back();
    // update();
  }

  int totalItemRp(int index) {
    return checkoutProduk[index].hargaBarang! * checkoutProduk[index].quantity!;
  }

  int totalPayment() {
    int totalPembayaran = 0;
    for (var produk in checkoutProduk) {
      totalPembayaran += produk.hargaBarang! * produk.quantity!;
    }
    return totalPembayaran;
  }

  onTapPesan() async {
    final parsedDate =
        DateFormat('yyyy-MM-dd').parse(DateTime.now().toString());
    // final parsedDate = DateFormat('yyyy-MM-dd')
    //     .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

    // final time = DateFormat('dd/MM/yyyy, HH:mm:ss').format(DateTime.now());
    final response = await TransaksiUseCase(
            repository: TransaksiRepositoryImpl(
                remoteDataSource: TransaksiRemoteDataSourceImpl()))
        .postTransaksiCO(
            idOutlet: FirebaseAuthServices.getUID(),
            tanggal: parsedDate,
            tipePayment: selectedPayment!,
            total: totalPayment(),
            productId: 10,
            jumlah: Get.find<CartController>().listKeranjang.length,
            harga: "23000");
    response.fold((failure) => log("Error: ${failure.message}"),
        (message) => log(message));
    await Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => Get.back());
    Get.back();
    Get.find<BaseController>().changeScreen(2);
    Get.back();
  }
}
