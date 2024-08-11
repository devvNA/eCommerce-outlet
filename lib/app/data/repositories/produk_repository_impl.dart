import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../domain/repositories/produk_repository.dart';
import '../datasources/produk_remote_datasources.dart';
import '../models/produk_model.dart';

class ProdukRepositoryImpl implements ProdukRepository {
  final ProdukRemoteDataSource remoteDataSource;

  ProdukRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Produk>>> getListProduct() async =>
      await remoteDataSource.getAllProduk();

  @override
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
          {required String kategori}) async =>
      await remoteDataSource.getListProductByCategory(kategori: kategori);

  @override
  Future<Either<Failure, String>> addToCart(
          {required int idUser, required Produk produk}) async =>
      await remoteDataSource.addToCart(idUser: idUser, produk: produk);

  @override
  Future<Either<Failure, List<String>>> getCategoryList() async =>
      await remoteDataSource.getCategoryList();
}
