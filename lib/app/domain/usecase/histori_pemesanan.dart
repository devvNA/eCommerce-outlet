import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/histori_pemesanan_model.dart';
import '../repositories/histori_pemesanan_repository.dart';

class HistoriPemesananUseCase {
  final HistoriPemesananRepository repository;

  HistoriPemesananUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<HistoriPemesanan>>>
      getListHistoriPemesanan() async {
    return await repository.getListHistoriPemesanan();
  }

  Future<Either<Failure, bool>> uploadBuktiPembayaran(
          {required int idTransaksi, required XFile urlBukti}) async =>
      await repository.uploadBuktiPembayaran(
          idTransaksi: idTransaksi, urlBukti: urlBukti);
}
