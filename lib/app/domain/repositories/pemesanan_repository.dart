import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';

abstract class PemesananRepository {
  Future<Either<Failure, String>> postPemesanan({
    required int idUser,
    required String tanggal,
    required String tipePayment,
    required int total,
  });
}
