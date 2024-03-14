import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/domain/repositories/keranjang_repository.dart';

import '../../data/models/keranjang/keranjang_model.dart';

class KeranjangUseCase {
  final KeranjangRepository repository;

  KeranjangUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async {
    return await repository.getListKeranjang();
  }
}
