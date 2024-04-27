import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';
import '../../core/utils/api_endpoints.dart';
import '../models/keranjang/keranjang_model.dart';

abstract class KeranjangRemoteDataSource {
  Future<Either<Failure, List<Keranjang>>> getListKeranjang();
  Future<Either<Failure, String>> deleteItemKeranjang(int id);
  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty);
}

class KeranjangRemoteDataSourceImpl implements KeranjangRemoteDataSource {
  @override
  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async {
    try {
      final response = await Request().get(
        listKeranjang,
        requiresAuthToken: true,
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
        requiresAuthToken: true,
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
  Future<Either<Failure, String>> updateItemKeranjang(int id, int qty) async {
    try {
      final response = await Request().put(
        "$updateKeranjang/$id?quantity=$qty",
        requiresAuthToken: true,
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
