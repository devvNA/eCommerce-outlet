import 'package:dartz/dartz.dart';
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
        requiresAuthToken: true,
        data: {
          "id_user": idUser,
          "tanggal": tanggal,
          "tipe_payment": tipePayment,
          "total": total
        },
      );

      return Right(response.data["message"]);
    } catch (e) {
      //error parsing json
      return Left(ParsingFailure(e.toString()));
    }
  }
}
