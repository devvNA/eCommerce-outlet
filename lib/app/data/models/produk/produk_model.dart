import 'dart:convert';

class Produk {
  int? id;
  String? gambar;
  String? nama;
  int? harga;
  String? deskripsi;
  String? jenisBarang;
  int? stok;

  Produk({
    this.id,
    this.gambar,
    this.nama,
    this.harga,
    this.deskripsi,
    this.jenisBarang,
    this.stok,
  });

  Produk copyWith({
    int? id,
    String? gambar,
    String? nama,
    int? harga,
    String? deskripsi,
    String? jenisBarang,
    int? stok,
  }) =>
      Produk(
        id: id ?? this.id,
        gambar: gambar ?? this.gambar,
        nama: nama ?? this.nama,
        harga: harga ?? this.harga,
        deskripsi: deskripsi ?? this.deskripsi,
        jenisBarang: jenisBarang ?? this.jenisBarang,
        stok: stok ?? this.stok,
      );

  factory Produk.fromRawJson(String str) => Produk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        gambar: json["gambar"],
        nama: json["nama"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        jenisBarang: json["jenis_barang"],
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gambar": gambar,
        "nama": nama,
        "harga": harga,
        "deskripsi": deskripsi,
        "jenis_barang": jenisBarang,
        "stok": stok,
      };
}
