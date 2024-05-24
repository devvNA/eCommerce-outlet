import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/data/datasources/transaksi_remote_datasource.dart';

import '../../domain/repositories/transaksi_repository.dart';

class TransaksiRepositoryImpl implements TransaksiRepository {
  TransaksiRepositoryImpl({required this.remoteDataSource});

  final TransaksiRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> postTransaksiCO({
    required int idOutlet,
    required DateTime tanggal,
    required String tipePayment,
    required int total,
    required int productId,
    required int jumlah,
    required String harga,
  }) async =>
      await remoteDataSource.postTransaksiCO(
          idOutlet: idOutlet,
          tanggal: tanggal,
          tipePayment: tipePayment,
          total: total,
          productId: productId,
          jumlah: jumlah,
          harga: harga);
}
