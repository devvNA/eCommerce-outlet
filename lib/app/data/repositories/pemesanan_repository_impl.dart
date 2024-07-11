import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/data/datasources/pemesanan_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/pemesanan_model.dart';

import '../../domain/repositories/pemesanan_repository.dart';

class PemesananRepositoryImpl implements PemesananRepository {
  PemesananRepositoryImpl({required this.remoteDataSource});

  final PemesananRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> postPemesanan({
    required int idUser,
    required String tanggal,
    required String tipePayment,
    required int total,
  }) async =>
      await remoteDataSource.postPemesanan(
          idUser: idUser,
          tanggal: tanggal,
          tipePayment: tipePayment,
          total: total);

  @override
  Future<Either<Failure, List<Pemesanan>>> getListHistoriPemesanan() async =>
      await remoteDataSource.getListHistoriPemesanan();
}
