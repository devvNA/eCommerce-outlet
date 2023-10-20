import 'package:dartz/dartz.dart';

import '../../data/types.dart';
import '../failures/failure.dart';
import '../repositories/product_repository.dart';

class ProductUseCase {
  ProductRepository repository;

  ProductUseCase({
    required this.repository,
  });

  Future<Either<Failure, ListProduct>> getListProduct() async {
    return await repository.getListProduct();
  }
}
