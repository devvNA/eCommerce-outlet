// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailTransferController extends GetxController {
  final totalBayar = Get.arguments;
  // Variabel untuk menyimpan sisa waktu
  final remainingSeconds = 0.obs;
  Timer? _timer;

  final Rx<DateTime> _dueDate =
      DateTime.now().add(const Duration(hours: 24)).obs;

  String get formattedDueDate {
    return DateFormat('dd MMM yyyy, HH:mm').format(_dueDate.value);
  }

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi timer saat controller diinisialisasi
    startPaymentTimer();
    // Atur tanggal jatuh tempo saat controller diinisialisasi
    _dueDate.value = DateTime.now().add(const Duration(hours: 24));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Pastikan untuk membatalkan timer saat controller ditutup
    _timer?.cancel();
    super.onClose();
  }

  // Fungsi untuk memulai timer pembayaran
  void startPaymentTimer() {
    // Misalnya, batas waktu pembayaran adalah 24 jam
    const int paymentDurationInSeconds = 24 * 60 * 60;
    remainingSeconds.value = paymentDurationInSeconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
        // Di sini Anda bisa menambahkan logika ketika waktu habis
        // Misalnya, menampilkan pesan atau melakukan tindakan tertentu
      }
    });
  }

  // Fungsi untuk mendapatkan waktu tersisa dalam format yang mudah dibaca
  String get remainingTime {
    int hours = remainingSeconds.value ~/ 3600;
    int minutes = (remainingSeconds.value % 3600) ~/ 60;
    return '$hours Jam $minutes menit';
  }
}
