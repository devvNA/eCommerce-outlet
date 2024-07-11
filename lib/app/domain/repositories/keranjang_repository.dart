import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../data/models/keranjang_model.dart';
import '../../data/models/produk_model.dart';

abstract class KeranjangRepository {
  Future<Either<Failure, String>> addToCart(
      {required int idUser, required Produk produk});
  Future<Either<Failure, List<Keranjang>>> getListKeranjang();
  Future<Either<Failure, String>> deleteProdukKeranjang(int id);
  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty);
}
