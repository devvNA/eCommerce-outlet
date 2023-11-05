import 'package:dartz/dartz.dart';

import '../../core/types.dart';
import '../../core/failure.dart';
import '../repositories/product_repository.dart';

class ProductUseCase {
  ProductRepository repository;

  ProductUseCase({
    required this.repository,
  });

  Future<Either<Failure, ListProduk>> getListProduct() async {
    return await repository.getListProduct();
  }

  Future<Either<Failure, ListProduk>> getListProductByCategory(
      String kategori) async {
    return await repository.getListProductByCategory(kategori);
  }
}
