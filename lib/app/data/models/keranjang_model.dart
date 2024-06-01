// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Keranjang extends Equatable {
  Keranjang({
    this.idKeranjang,
    this.idProduk,
    this.namaBarang,
    this.jenisBarang,
    this.hargaBarang,
    this.quantity,
  });

  final int? idKeranjang;
  final int? idProduk;
  final String? namaBarang;
  final String? jenisBarang;
  final int? hargaBarang;
  int? quantity;

  factory Keranjang.fromJson(Map<String, dynamic> json) {
    return Keranjang(
      idKeranjang: json["id_keranjang"],
      idProduk: json["id_produk"],
      namaBarang: json["nama_barang"],
      jenisBarang: json["jenis_barang"],
      hargaBarang: json["harga_barang"],
      quantity: json["quantity"],
    );
  }

  @override
  List<Object?> get props => [
        idKeranjang,
        idProduk,
        namaBarang,
        jenisBarang,
        hargaBarang,
        quantity,
      ];
}
