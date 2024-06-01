import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/keranjang_model.dart';

abstract class PemesananRepository {
  Future<Either<Failure, String>> postPemesanan({
    required int idOutlet,
    required String tanggal,
    required String tipePayment,
    required int total,
    required List<Keranjang> produkKeranjang,
  });
}
