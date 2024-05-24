import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/produk/produk_model.dart';

abstract class ProdukRepository {
  Future<Either<Failure, List<Produk>>> getListProduct();
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      {required String kategori});
  Future<Either<Failure, String>> addToCart(
      {required int id, required Produk produk});
}
