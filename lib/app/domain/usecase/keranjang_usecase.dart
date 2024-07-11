import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/keranjang_model.dart';
import '../../data/models/produk_model.dart';
import '../repositories/keranjang_repository.dart';

class KeranjangUseCase {
  final KeranjangRepository repository;

  KeranjangUseCase({
    required this.repository,
  });

  Future<Either<Failure, String>> addToCart(
          {required int idUser, required Produk produk}) async =>
      await repository.addToCart(produk: produk, idUser: idUser);

  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async {
    return await repository.getListKeranjang();
  }

  Future<Either<Failure, String>> deleteProdukKeranjang(int id) async {
    return await repository.deleteProdukKeranjang(id);
  }

  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty) async {
    return await repository.updateItemKeranjang(id, qty);
  }
}
