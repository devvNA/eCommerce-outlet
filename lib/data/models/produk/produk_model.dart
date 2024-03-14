// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

Produk produkFromJson(String str) => Produk.fromJson(json.decode(str));

String produkToJson(Produk data) => json.encode(data.toJson());

class Produk {
  final int? id;
  final String? gambar;
  final String? nama;
  final int? harga;
  final String? deskripsi;
  final int? stok;

  Produk({
    this.id,
    this.gambar,
    this.nama,
    this.harga,
    this.deskripsi,
    this.stok,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        gambar: json["gambar"],
        nama: json["nama"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gambar": gambar,
        "nama": nama,
        "harga": harga,
        "deskripsi": deskripsi,
        "stok": stok,
      };
}
