import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../data/models/product/produk_model.dart';
import '../repositories/product_repository.dart';

class ProductUseCase {
  ProductRepository repository;

  ProductUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Produk>>> getListProduct() async {
    return await repository.getListProduct();
  }

  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      String kategori) async {
    return await repository.getListProductByCategory(kategori);
  }
}
