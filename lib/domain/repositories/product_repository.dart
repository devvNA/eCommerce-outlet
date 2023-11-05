import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../data/models/product/produk_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Produk>>> getListProduct();
  Future<Either<Failure, List<Produk>>> getListProductByCategory(String kategori);
}
