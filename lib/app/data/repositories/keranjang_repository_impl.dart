import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/data/datasources/keranjang_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang/keranjang_model.dart';
import 'package:marvelindo_outlet/app/domain/repositories/keranjang_repository.dart';

class KeranjangRepositoryImpl implements KeranjangRepository {
  KeranjangRepositoryImpl({
    required this.remoteDataSource,
  });

  final KeranjangRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> deleteProdukKeranjang(int id) async =>
      await remoteDataSource.deleteItemKeranjang(id);

  @override
  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async =>
      await remoteDataSource.getListKeranjang();

  @override
  Future<Either<Failure, String>> increaseItemKeranjang(
          int id, int currQty) async =>
      await remoteDataSource.increaseItemKeranjang(id, currQty);

  @override
  Future<Either<Failure, String>> decreaseItemKeranjang(
          int id, int currQty) async =>
      await remoteDataSource.decreaseItemKeranjang(id, currQty);

  @override
  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty) async =>
      await remoteDataSource.updateItemKeranjang(id, qty);
}
