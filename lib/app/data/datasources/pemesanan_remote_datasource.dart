import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marvelindo_outlet/app/core/api_endpoints.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';

abstract class PemesananRemoteDataSource {
  Future<Either<Failure, String>> postPemesanan({
    required int idUser,
    required String tanggal,
    required String tipePayment,
    required int total,
  });
}

class PemesananRemoteDataSourceImpl implements PemesananRemoteDataSource {
  @override
  Future<Either<Failure, String>> postPemesanan({
    required int idUser,
    required String tanggal,
    required String tipePayment,
    required int total,
  }) async {
    try {
      final response = await Request().post(
        checkout,
        data: {
          "id_user": idUser,
          "tanggal": tanggal,
          "tipe_payment": tipePayment,
          "total": total
        },
      );

      if (response.statusCode == 201) {
        return Right(response.data["message"]);
      } else if (response.statusCode == 500) {
        return const Left(ConnectionFailure("Internal Server Error"));
      } else {
        return Left(ParsingFailure(response.data["message"]));
      }
    } on DioException catch (e) {
      return Left(ParsingFailure(e.response!.data["message"]));
    } catch (e) {
      return const Left(
          ParsingFailure("Terjadi kesalahan yang tidak diketahui"));
    }
  }
}
