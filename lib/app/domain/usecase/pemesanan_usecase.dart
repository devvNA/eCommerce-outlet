import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/domain/repositories/pemesanan_repository.dart';

import '../../data/models/keranjang_model.dart';

class PemesananUseCase {
  PemesananRepository repository;

  PemesananUseCase({
    required this.repository,
  });

  Future<Either<Failure, String>> postPemesanan({
    required int idOutlet,
    required String tanggal,
    required String tipePayment,
    required int total,
    required List<Keranjang> produkKeranjang,
  }) async =>
      await repository.postPemesanan(
        idOutlet: idOutlet,
        tanggal: tanggal,
        tipePayment: tipePayment,
        total: total,
        produkKeranjang: produkKeranjang,
      );
}
