import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/domain/repositories/transaksi_repository.dart';

class TransaksiUseCase {
  TransaksiRepository repository;

  TransaksiUseCase({
    required this.repository,
  });

  Future<Either<Failure, String>> postTransaksiCO({
    required int idOutlet,
    required DateTime tanggal,
    required String tipePayment,
    required int total,
    required int productId,
    required int jumlah,
    required String harga,
  }) async =>
      await repository.postTransaksiCO(
        idOutlet: idOutlet,
        tanggal: tanggal,
        tipePayment: tipePayment,
        total: total,
        productId: productId,
        jumlah: jumlah,
        harga: harga,
      );
}
