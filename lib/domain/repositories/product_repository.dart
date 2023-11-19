import 'package:dartz/dartz.dart';

import '../../core/networking/failure.dart';
import '../../data/models/produk/produk_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Produk>>> getListProduct();
  Future<Either<Failure, List<Produk>>> getListProductByCategory(String kategori);
}
