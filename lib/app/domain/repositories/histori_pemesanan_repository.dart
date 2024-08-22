import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvelindo_outlet/app/data/models/histori_pemesanan_model.dart';

import '../../core/networking/failure_helper.dart';

abstract class HistoriPemesananRepository {
  Future<Either<Failure, List<HistoriPemesanan>>> getListHistoriPemesanan();
  Future<Either<Failure, bool>> uploadBuktiPembayaran(
      {required int idTransaksi, required XFile urlBukti});
}
