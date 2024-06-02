import 'package:equatable/equatable.dart';

class Pemesanan extends Equatable {
  const Pemesanan({
    required this.id,
    required this.idOutlet,
    required this.tanggal,
    required this.tipePayment,
    required this.total,
    required this.status,
    required this.detailProduk,
  });

  final int id;
  final int idOutlet;
  final String tanggal;
  final String tipePayment;
  final int total;
  final String status;
  final List<DetailProduk> detailProduk;

  Pemesanan copyWith({
    int? id,
    int? idOutlet,
    String? tanggal,
    String? tipePayment,
    int? total,
    String? status,
    List<DetailProduk>? detailProduk,
  }) {
    return Pemesanan(
      id: id ?? this.id,
      idOutlet: idOutlet ?? this.idOutlet,
      tanggal: tanggal ?? this.tanggal,
      tipePayment: tipePayment ?? this.tipePayment,
      total: total ?? this.total,
      status: status ?? this.status,
      detailProduk: detailProduk ?? this.detailProduk,
    );
  }

  factory Pemesanan.fromJson(Map<String, dynamic> json) {
    return Pemesanan(
      id: json["id"] ?? 0,
      idOutlet: json["id_outlet"] ?? 0,
      tanggal: json["tanggal"] ?? "",
      tipePayment: json["tipe_payment"] ?? "",
      total: json["total"] ?? 0,
      status: json["status"] ?? "",
      detailProduk: json["detail_produk"] == null
          ? []
          : List<DetailProduk>.from(
              json["detail_produk"]!.map((x) => DetailProduk.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        idOutlet,
        tanggal,
        tipePayment,
        total,
        status,
        detailProduk,
      ];
}

class DetailProduk extends Equatable {
  const DetailProduk({
    required this.idMTransaksi,
    required this.idProduk,
    required this.jumlah,
    required this.harga,
  });

  final int idMTransaksi;
  final int idProduk;
  final int jumlah;
  final String harga;

  DetailProduk copyWith({
    int? idMTransaksi,
    int? idProduk,
    int? jumlah,
    String? harga,
  }) {
    return DetailProduk(
      idMTransaksi: idMTransaksi ?? this.idMTransaksi,
      idProduk: idProduk ?? this.idProduk,
      jumlah: jumlah ?? this.jumlah,
      harga: harga ?? this.harga,
    );
  }

  factory DetailProduk.fromJson(Map<String, dynamic> json) {
    return DetailProduk(
      idMTransaksi: json["id_m_transaksi"] ?? 0,
      idProduk: json["id_produk"] ?? 0,
      jumlah: json["jumlah"] ?? 0,
      harga: json["harga"] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        idMTransaksi,
        idProduk,
        jumlah,
        harga,
      ];
}
