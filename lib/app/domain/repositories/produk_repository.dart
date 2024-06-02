import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/produk_model.dart';

abstract class ProdukRepository {
  Future<Either<Failure, List<Produk>>> getListProduct();
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      {required String kategori});
}
