import 'package:dartz/dartz.dart';

import '../../core/types.dart';
import '../../core/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ListProduk>> getListProduct();
  Future<Either<Failure, ListProduk>> getListProductByCategory(String kategori);
}
