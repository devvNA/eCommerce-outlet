import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/products_remote_datasources.dart';
import '../../core/types.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ListProduk>> getListProduct() async =>
      await remoteDataSource.getListProduct();

  @override
  Future<Either<Failure, ListProduk>> getListProductByCategory(
          String kategori) async =>
      await remoteDataSource.getListProductByCategory(kategori);
}
