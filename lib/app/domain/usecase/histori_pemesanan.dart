import 'package:dartz/dartz.dart';

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
}
