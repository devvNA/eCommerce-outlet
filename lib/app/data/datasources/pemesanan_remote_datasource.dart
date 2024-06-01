import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/api_endpoints.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';
import '../models/keranjang_model.dart';

abstract class PemesananRemoteDataSource {
  Future<Either<Failure, String>> postPemesanan({
    required int idOutlet,
    required String tanggal,
    required String tipePayment,
    required int total,
    required List<Keranjang> produkKeranjang,
  });
}

class PemesananRemoteDataSourceImpl implements PemesananRemoteDataSource {
  @override
  Future<Either<Failure, String>> postPemesanan({
    required int idOutlet,
    required String tanggal,
    required String tipePayment,
    required int total,
    required List<Keranjang> produkKeranjang,
  }) async {
    try {
      final body = {
        "id_outlet": idOutlet,
        "tanggal": tanggal,
        "tipe_payment": tipePayment,
        "total": total,
        'produk': produkKeranjang
            .map((item) => {
                  'id_produk': item.idProduk,
                  'jumlah': item.quantity,
                  'harga': item.hargaBarang,
                })
            .toList(),
      };

      final response = await Request().post(
        checkout,
        requiresAuthToken: false,
        data: body,
      );

      return Right(response.data["message"]);
    } catch (e) {
      //error parsing json
      return Left(ParsingFailure(e.toString()));
    }
  }
}
