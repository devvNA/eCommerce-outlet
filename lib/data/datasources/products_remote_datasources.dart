// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/failures/failure.dart';
import '../api_endpoints.dart';
import '../models/product/products_model.dart';
import '../services/network_request.dart';
import '../types.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, ListProduct>> getListProduct();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<Either<Failure, ListProduct>> getListProduct() async {
    try {
      final request = Request();

      // final response = await Dio().get(bookUrl);
      final response = await request.get(listProducts);

      ListProduct products = [];
      if (response.statusCode == 200) {
        // debugPrint('Status: ${response.statusMessage}');
        for (var value in response.data) {
          final result = Products.fromJson(value);
          products.add(result);
        }
        return Right(products);
      }
      // debugPrint('Data: ${response.data}');
      return Left(ConnectionFailure(response.data['message']));
    } on DioError catch (_) {
      return const Left(ConnectionFailure("Terjadi Kesalahan"));
    } catch (_) {
      return const Left(ParsingFailure("Tidak dapat memparsing respon"));
    }
  }
}
