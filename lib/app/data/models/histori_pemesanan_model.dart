import 'package:equatable/equatable.dart';

class HistoriPemesanan extends Equatable {
  final int id;
  final int idUser;
  final String tanggal;
  final String tipePayment;
  final int total;
  final String status;
  final List<DetailProduk> detailProduk;

  const HistoriPemesanan({
    required this.id,
    required this.idUser,
    required this.tanggal,
    required this.tipePayment,
    required this.total,
    required this.status,
    required this.detailProduk,
  });

  HistoriPemesanan copyWith({
    int? id,
    int? idUser,
    String? tanggal,
    String? tipePayment,
    int? total,
    String? status,
    List<DetailProduk>? detailProduk,
  }) {
    return HistoriPemesanan(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      tanggal: tanggal ?? this.tanggal,
      tipePayment: tipePayment ?? this.tipePayment,
      total: total ?? this.total,
      status: status ?? this.status,
      detailProduk: detailProduk ?? this.detailProduk,
    );
  }

  factory HistoriPemesanan.fromJson(Map<String, dynamic> json) {
    return HistoriPemesanan(
      id: json["id"] ?? 0,
      idUser: json["id_user"] ?? 0,
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "tanggal": tanggal,
        "tipe_payment": tipePayment,
        "total": total,
        "status": status,
        "detail_produk": detailProduk.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        id,
        idUser,
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
    required this.nama,
  });

  final int idMTransaksi;
  final int idProduk;
  final int jumlah;
  final String harga;
  final String nama;

  DetailProduk copyWith({
    int? idMTransaksi,
    int? idProduk,
    int? jumlah,
    String? harga,
    String? nama,
  }) {
    return DetailProduk(
      idMTransaksi: idMTransaksi ?? this.idMTransaksi,
      idProduk: idProduk ?? this.idProduk,
      jumlah: jumlah ?? this.jumlah,
      harga: harga ?? this.harga,
      nama: nama ?? this.nama,
    );
  }

  factory DetailProduk.fromJson(Map<String, dynamic> json) {
    return DetailProduk(
      idMTransaksi: json["id_m_transaksi"] ?? 0,
      idProduk: json["id_produk"] ?? 0,
      jumlah: json["jumlah"] ?? 0,
      harga: json["harga"] ?? "",
      nama: json["nama"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id_m_transaksi": idMTransaksi,
        "id_produk": idProduk,
        "jumlah": jumlah,
        "harga": harga,
        "nama": nama,
      };

  @override
  List<Object?> get props => [
        idMTransaksi,
        idProduk,
        jumlah,
        harga,
        nama,
      ];
}
