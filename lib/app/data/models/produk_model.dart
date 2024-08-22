import 'package:equatable/equatable.dart';

class Produk extends Equatable {
  const Produk({
    required this.id,
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.jenisBarang,
    required this.stok,
  });

  final int id;
  final String gambar;
  final String nama;
  final int harga;
  final String deskripsi;
  final String jenisBarang;
  final int stok;

  Produk copyWith({
    int? id,
    dynamic gambar,
    String? nama,
    int? harga,
    String? deskripsi,
    String? jenisBarang,
    int? stok,
  }) {
    return Produk(
      id: id ?? this.id,
      gambar: gambar ?? this.gambar,
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      deskripsi: deskripsi ?? this.deskripsi,
      jenisBarang: jenisBarang ?? this.jenisBarang,
      stok: stok ?? this.stok,
    );
  }

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json["id"] ?? 0,
      gambar: json["gambar"] ?? "",
      nama: json["nama"] ?? "",
      harga: json["harga"] ?? 0,
      deskripsi: json["deskripsi"] ?? "",
      jenisBarang: json["jenis_barang"] ?? "",
      stok: json["stok"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "gambar": gambar,
        "nama": nama,
        "harga": harga,
        "deskripsi": deskripsi,
        "jenis_barang": jenisBarang,
        "stok": stok,
      };

  @override
  List<Object?> get props => [
        id,
        gambar,
        nama,
        harga,
        deskripsi,
        jenisBarang,
        stok,
      ];
}
