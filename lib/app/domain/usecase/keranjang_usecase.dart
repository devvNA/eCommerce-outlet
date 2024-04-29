import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/keranjang/keranjang_model.dart';
import '../repositories/keranjang_repository.dart';

class KeranjangUseCase {
  final KeranjangRepository repository;

  KeranjangUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async {
    return await repository.getListKeranjang();
  }

  Future<Either<Failure, String>> deleteProdukKeranjang(int id) async {
    return await repository.deleteProdukKeranjang(id);
  }

  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty) async {
    return await repository.updateItemKeranjang(id, qty);
  }

  Future<Either<Failure, String>> increaseItemKeranjang(
      int id, int currQty) async {
    return await repository.increaseItemKeranjang(id, currQty);
  }

  Future<Either<Failure, String>> decreaseItemKeranjang(
      int id, int currQty) async {
    return await repository.decreaseItemKeranjang(id, currQty);
  }
}
