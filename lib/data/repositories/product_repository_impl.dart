import 'package:dartz/dartz.dart';

import '../../domain/failures/failure.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/products_remote_datasources.dart';
import '../types.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ListProduct>> getListProduct() async =>
      await remoteDataSource.getListProduct();
}
