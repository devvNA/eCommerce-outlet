import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marvelindo_outlet/app/core/api_endpoints.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';

abstract class TransaksiRemoteDataSource {
  Future<Either<Failure, String>> postTransaksiCO({
    required int idOutlet,
    required DateTime tanggal,
    required String tipePayment,
    required int total,
    required int productId,
    required int jumlah,
    required String harga,
  });
}

class TransaksiRemoteDataSourceImpl implements TransaksiRemoteDataSource {  
  @override
  Future<Either<Failure, String>> postTransaksiCO({
    required int idOutlet,
    required DateTime tanggal,
    required String tipePayment,
    required int total,
    required int productId,
    required int jumlah,
    required String harga,
  }) async {
    try {
      final queryParameters = {
        'id_outlet': idOutlet,
        'tanggal': tanggal,
        'tipe_payment': tipePayment,
        'total': total,
        'id_produk': productId,
        'jumlah': jumlah,
        'harga': harga,
      };

      final response = await Request().post(
        checkout,
        requiresAuthToken: false,
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
}
