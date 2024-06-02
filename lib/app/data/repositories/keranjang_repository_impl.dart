import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/data/datasources/keranjang_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang_model.dart';
import 'package:marvelindo_outlet/app/domain/repositories/keranjang_repository.dart';

import '../models/produk_model.dart';

class KeranjangRepositoryImpl implements KeranjangRepository {
  KeranjangRepositoryImpl({
    required this.remoteDataSource,
  });

  final KeranjangRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> addToCart(
          {required int id, required Produk produk}) async =>
      await remoteDataSource.addToCart(id: id, produk: produk);

  @override
  Future<Either<Failure, String>> deleteProdukKeranjang(int id) async =>
      await remoteDataSource.deleteItemKeranjang(id);

  @override
  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async =>
      await remoteDataSource.getListKeranjang();

  @override
  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty) async =>
      await remoteDataSource.updateItemKeranjang(id, qty);
}
