// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class AboutAppController extends GetxController {
  List features = [
    {
      'title': 'Halaman Utama (HomePage)',
      'description':
          'Menampilkan daftar produk elektronik yang tersedia. Menampilkan penawaran khusus dan promosi terbaru.',
    },
    {
      'title': 'Pencarian Produk (Product Search)',
      'description':
          'Menampilkan sambutan dan informasi singkat tentang aplikasi.Menampilkan daftar produk elektronik yang tersedia. Menampilkan penawaran khusus dan promosi terbaru.',
    },
    {
      'title': 'Halaman Produk (Product Details)',
      'description':
          'Memungkinkan pengguna untuk mencari produk berdasarkan kata kunci atau kategori. Menampilkan hasil pencarian yang relevan dengan detail produk seperti harga, deskripsi, dan stok.',
    },
    {
      'title': 'Keranjang Belanja (Shopping Cart)',
      'description':
          'Menampilkan produk yang telah ditambahkan ke dalam keranjang belanja.',
    },
    {
      'title': 'Pembayaran (Payment)',
      'description':
          'Memungkinkan pengguna untuk melakukan pembayaran dengan metode yang tersedia. Menyediakan opsi pembayaran seperti transfer bank, dan Cash On Delivery (COD).',
    },
    {
      'title': 'Riwayat Transaksi (Transaction History)',
      'description':
          'Menyimpan riwayat transaksi pengguna. Menampilkan daftar transaksi sebelumnya dengan detail seperti tanggal, produk yang dibeli, dan total harga.',
    },
    {
      'title': 'Profil Pengguna (User Profile)',
      'description':
          'Memungkinkan pengguna untuk mengelola profil mereka. Menyediakan opsi untuk mengubah informasi pengguna, alamat pengiriman, dan metode pembayaran yang digunakan. Memungkinkan pengguna untuk logout dari akun mereka.',
    }
  ];

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
