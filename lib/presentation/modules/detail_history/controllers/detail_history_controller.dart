// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class DetailHistoryController extends GetxController {
  // contoh data history pemesanan produk
  final history = Rx<Map<String, dynamic>>({
    'id': 'H001',
    'tanggal': '01/02/2024',
    'total': 150000,
    'status': 'Selesai',
    'produk': [
      {'nama': 'Sepatu', 'harga': 100000, 'jumlah': 5},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Kaos', 'harga': 75000, 'jumlah': 3},
    ]
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
