import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/data/models/pemesanan_model.dart';

import '../../core/networking/failure_helper.dart';

abstract class HistoriPemesananRepository {
  Future<Either<Failure, List<Pemesanan>>> getListHistoriPemesanan();
}
