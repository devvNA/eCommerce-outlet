import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/produk_model.dart';
import '../repositories/produk_repository.dart';

class ProdukUseCase {
  ProdukRepository repository;

  ProdukUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Produk>>> getListProduct() async =>
      await repository.getListProduct();

  Future<Either<Failure, List<Produk>>> getListProductByCategory(
          {required String kategori}) async =>
      await repository.getListProductByCategory(kategori: kategori);

}
