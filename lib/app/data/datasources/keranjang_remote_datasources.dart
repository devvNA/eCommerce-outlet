import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/api_endpoints.dart';
import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';
import '../models/keranjang_model.dart';

abstract class KeranjangRemoteDataSource {
  Future<Either<Failure, List<Keranjang>>> getListKeranjang();
  Future<Either<Failure, String>> deleteItemKeranjang(int id);
  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty);
  Future<Either<Failure, String>> increaseItemKeranjang(int id, int currQty);
  Future<Either<Failure, String>> decreaseItemKeranjang(int id, int currQty);
}

class KeranjangRemoteDataSourceImpl implements KeranjangRemoteDataSource {
  @override
  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async {
    try {
      final response = await Request().get(
        listKeranjang,
      );
      List<Keranjang> keranjang = [];
      if (response.statusCode == 200) {
        for (var value in response.data["data"]) {
          final result = Keranjang.fromJson(value);
          keranjang.add(result);
        }
        return Right(keranjang);
      }
      // debugPrint('Data: ${response.data}');
      return Left(ConnectionFailure(response.data));
    } catch (e) {
      //error parsing json
      return Left(ParsingFailure(e.toString()));
      // return Left(ParsingFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteItemKeranjang(int id) async {
    try {
      final response = await Request().delete(
        "$deleteKeranjang/$id",
      );
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      }
      return Left(ConnectionFailure(response.data));
    } on DioException catch (e) {
      return Left(ParsingFailure(e.toString()));
    } catch (e) {
      return const Left(ParsingFailure('Tidak dapat memparsing respon'));
    }
  }

  @override
  Future<Either<Failure, String>> updateItemKeranjang(
    int productId,
    int qty,
  ) async {
    try {
      final queryParameters = {
        'quantity': qty,
      };

      final response = await Request().put(
        // "$updateKeranjang/$id?quantity=$qty",
        "$updateKeranjang/$productId",

        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      }
      return Left(ConnectionFailure(response.data));
    } on DioException catch (e) {
      return Left(ParsingFailure(e.toString()));
    } catch (e) {
      return const Left(ParsingFailure('Tidak dapat memparsing respon'));
    }
  }

  @override
  Future<Either<Failure, String>> increaseItemKeranjang(
      int productId, int currQty) async {
    try {
      final query = {
        'quantity': currQty + 1,
      };

      final response = await Request().put(
        "$updateKeranjang/$productId",
        queryParameters: query,
      );
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      }
      return Left(ConnectionFailure(response.data));
    } on DioException catch (e) {
      return Left(ParsingFailure(e.toString()));
    } catch (e) {
      return const Left(ParsingFailure('Tidak dapat memparsing respon'));
    }
  }

  @override
  Future<Either<Failure, String>> decreaseItemKeranjang(
    int productId,
    int currQty,
  ) async {
    try {
      final query = {
        'quantity': currQty - 1,
      };

      final response = await Request().put(
        "$updateKeranjang/$productId",
        queryParameters: query,
      );
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      }
      return Left(ConnectionFailure(response.data));
    } on DioException catch (e) {
      return Left(ParsingFailure(e.toString()));
    } catch (e) {
      return const Left(ParsingFailure('Tidak dapat memparsing respon'));
    }
  }
}
