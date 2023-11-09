// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/failure.dart';
import '../../core/api_endpoints.dart';
import '../models/product/produk_model.dart';
import '../../core/network_request.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, List<Produk>>> getListProduct();
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      String kategori);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<Either<Failure, List<Produk>>> getListProduct() async {
    try {
      final response = await Request().get(listProduk, requiresAuthToken: true);

      List<Produk> products = [];
      if (response.statusCode == 200) {
        // debugPrint('Status: ${response.statusMessage}');
        for (var value in response.data["data"]) {
          final result = Produk.fromJson(value);
          products.add(result);
        }
        return Right(products);
      }
      // debugPrint('Data: ${response.data}');
      return Left(ConnectionFailure(response.data));
    } on DioError catch (_) {
      //error koneksi
      return const Left(ConnectionFailure("Terjadi Kesalahan"));
    } catch (_) {
      //error parsing json
      return const Left(ParsingFailure("Tidak dapat memparsing respon"));
    }
  }

  @override
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      String kategori) async {
    try {
      final response = await Request()
          .get("$listProdukByCategory/$kategori", requiresAuthToken: true);

      List<Produk> products = [];
      if (response.statusCode == 200) {
        for (var value in response.data['data']) {
          final result = Produk.fromJson(value);
          products.add(result);
        }
        return Right(products);
      }
      return Left(ConnectionFailure(response.data['message']));
    } on DioError catch (_) {
      return const Left(ConnectionFailure("Terjadi Kesalahan"));
    } catch (_) {
      return const Left(ParsingFailure("Tidak dapat memparsing respon"));
    }
  }
}
