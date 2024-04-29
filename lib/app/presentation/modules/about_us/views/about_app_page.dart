import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/about_app_controller.dart';

class AboutAppView extends GetView<AboutAppController> {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/icons/mv-logo.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              20.verticalSpace,
              const Text(
                "Selamat datang di Aplikasi CV Marvelindo Utama. Aplikasi ini merupakan solusi terintegrasi untuk memudahkan transaksi antara pelanggan dengan perusahaan. Dengan fitur-fitur yang disediakan, kami bertujuan untuk mempercepat dan mempermudah proses bisnis serta memberikan informasi yang relevan.\n Di dalam aplikasi ini, Anda akan menemukan beberapa menu utama yang memuat fitur-fitur berikut:",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              15.verticalSpace,
              const Text(
                "1. Halaman Utama (HomePage):\nMenampilkan sambutan dan informasi singkat tentang aplikasi.Menampilkan daftar produk elektronik yang tersedia. Menampilkan penawaran khusus dan promosi terbaru.\n\n2. Pencarian Produk (Product Search):\nMemungkinkan pengguna untuk mencari produk berdasarkan kata kunci atau kategori. Menampilkan hasil pencarian yang relevan dengan detail produk seperti harga, deskripsi, dan stok.\n\n3. Halaman Produk (Product Details):\nMenampilkan informasi detail tentang produk yang dipilih. Menampilkan gambar produk, harga, stok, dan deskripsi produk. Memungkinkan pengguna untuk menambahkan produk ke dalam keranjang belanja.\n\n4. Keranjang Belanja (Shopping Cart):\nMenampilkan produk yang telah ditambahkan ke dalam keranjang belanja. Memungkinkan pengguna untuk mengubah jumlah produk atau menghapus produk dari keranjang. Menampilkan total harga belanjaan dan opsi untuk checkout.\n\n5. Pembayaran (Payment):\nMemungkinkan pengguna untuk melakukan pembayaran dengan metode yang tersedia. Menyediakan opsi pembayaran seperti transfer bank, kartu kredit, atau pembayaran melalui aplikasi pihak ketiga. Mengintegrasikan dengan sistem pembayaran dan mengkonfirmasi pembayaran yang berhasil.\n\n6. Riwayat Transaksi (Transaction History):\nMenyimpan riwayat transaksi pengguna. Menampilkan daftar transaksi sebelumnya dengan detail seperti tanggal, produk yang dibeli, dan total harga.\n\n7. Profil Pengguna (User Profile):\nMemungkinkan pengguna untuk mengelola profil mereka. Menyediakan opsi untuk mengubah informasi pengguna, alamat pengiriman, dan metode pembayaran yang digunakan. Memungkinkan pengguna untuk logout dari akun mereka.",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              15.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
