import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/data/models/histori_pemesanan_model.dart';

import '../../domain/repositories/histori_pemesanan_repository.dart';
import '../datasources/histori_pemesanan_datasource.dart';

class HistoriPemesananRepositoryImpl implements HistoriPemesananRepository {
  HistoriPemesananRepositoryImpl({
    required this.remoteDataSource,
  });

  final HistoriPemesananRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<HistoriPemesanan>>>
      getListHistoriPemesanan() async =>
          await remoteDataSource.getListHistoriPemesanan();

  @override
  Future<Either<Failure, bool>> uploadBuktiPembayaran(
          {required int idTransaksi, required XFile urlBukti}) async =>
      await remoteDataSource.uploadBuktiPembayaran(
          idTransaksi: idTransaksi, urlBukti: urlBukti);
}
