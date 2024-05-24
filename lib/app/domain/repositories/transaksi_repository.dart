import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';

abstract class TransaksiRepository {
  Future<Either<Failure, String>> postTransaksiCO({
    required int idOutlet,
    required DateTime tanggal,
    required String tipePayment,
    required int total,
    required int productId,
    required int jumlah,
    required String harga,
  });
}
