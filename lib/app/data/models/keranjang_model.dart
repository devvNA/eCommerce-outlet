// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Keranjang extends Equatable {
  Keranjang({
    required this.idKeranjang,
    required this.idProduk,
    required this.namaBarang,
    required this.jenisBarang,
    required this.hargaBarang,
    this.quantity,
    required this.stok,
  });

  final int idKeranjang;
  final int idProduk;
  final String namaBarang;
  final String jenisBarang;
  final int hargaBarang;
  int? quantity;
  final int stok;

  Keranjang copyWith({
    int? idKeranjang,
    int? idProduk,
    String? namaBarang,
    String? jenisBarang,
    int? hargaBarang,
    int? quantity,
    int? stok,
  }) {
    return Keranjang(
      idKeranjang: idKeranjang ?? this.idKeranjang,
      idProduk: idProduk ?? this.idProduk,
      namaBarang: namaBarang ?? this.namaBarang,
      jenisBarang: jenisBarang ?? this.jenisBarang,
      hargaBarang: hargaBarang ?? this.hargaBarang,
      quantity: quantity ?? this.quantity,
      stok: stok ?? this.stok,
    );
  }

  factory Keranjang.fromJson(Map<String, dynamic> json) {
    return Keranjang(
      idKeranjang: json["id_keranjang"] ?? 0,
      idProduk: json["id_produk"] ?? 0,
      namaBarang: json["nama_barang"] ?? "",
      jenisBarang: json["jenis_barang"] ?? "",
      hargaBarang: json["harga_barang"] ?? 0,
      quantity: json["quantity"] ?? 0,
      stok: json["stok"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_keranjang": idKeranjang,
        "id_produk": idProduk,
        "nama_barang": namaBarang,
        "jenis_barang": jenisBarang,
        "harga_barang": hargaBarang,
        "quantity": quantity,
        "stok": stok,
      };

  @override
  List<Object?> get props => [
        idKeranjang,
        idProduk,
        namaBarang,
        jenisBarang,
        hargaBarang,
        quantity,
        stok,
      ];
}
