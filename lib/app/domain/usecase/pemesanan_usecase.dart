import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/domain/repositories/pemesanan_repository.dart';

import '../../data/models/pemesanan_model.dart';

class PemesananUseCase {
  PemesananRepository repository;

  PemesananUseCase({
    required this.repository,
  });

  Future<Either<Failure, String>> postPemesanan({
    required int idUser,
    required String tanggal,
    required String tipePayment,
    required int total,
  }) async =>
      await repository.postPemesanan(
          idUser: idUser,
          tanggal: tanggal,
          tipePayment: tipePayment,
          total: total);

  Future<Either<Failure, List<Pemesanan>>> getListHistoriPemesanan() async {
    return await repository.getListHistoriPemesanan();
  }
}
