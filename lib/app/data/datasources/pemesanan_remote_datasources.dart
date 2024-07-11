import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/api_endpoints.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';
import '../models/pemesanan_model.dart';

abstract class PemesananRemoteDataSource {
  Future<Either<Failure, String>> postPemesanan({
    required int idUser,
    required String tanggal,
    required String tipePayment,
    required int total,
  });
  Future<Either<Failure, List<Pemesanan>>> getListHistoriPemesanan();
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
        body: {
          "id_user": idUser,
          "tanggal": tanggal,
          "tipe_payment": tipePayment,
          "total": total
        },
        // body: {
        //   "id_user": idUser,
        //   "tanggal": tanggal,
        //   "tipe_payment": tipePayment,
        //   "total": total,
        //   'produk': produkKeranjang
        //       .map((item) => {
        //             'id_produk': item.idProduk,
        //             'jumlah': item.quantity,
        //             'harga': item.hargaBarang,
        //           })
        //       .toList(),
        // },
      );

      return Right(response.data["message"]);
    } catch (e) {
      //error parsing json
      return Left(ParsingFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Pemesanan>>> getListHistoriPemesanan() async {
    try {
      final response = await Request().get(
        listHistoryPemesanan,
        requiresAuthToken: true,
      );
      List<Pemesanan> history = [];
      if (response.statusCode == 200) {
        for (var value in response.data) {
          final result = Pemesanan.fromJson(value);
          history.add(result);
        }
        return Right(history);
      }
      return Left(ConnectionFailure(response.data));
    } catch (e) {
      return Left(ParsingFailure(e.toString()));
    }
  }
}
