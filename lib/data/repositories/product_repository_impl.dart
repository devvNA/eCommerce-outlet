import 'package:dartz/dartz.dart';

import '../../core/networking/failure.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/products_remote_datasources.dart';
import '../models/produk/produk_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Produk>>> getListProduct() async =>
      await remoteDataSource.getListProduct();

  @override
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
          String kategori) async =>
      await remoteDataSource.getListProductByCategory(kategori);
}
