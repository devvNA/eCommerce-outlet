import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvelindo_outlet/app/data/models/histori_pemesanan_model.dart';

import '../../core/api_endpoints.dart';
import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';

abstract class HistoriPemesananRemoteDataSource {
  Future<Either<Failure, List<HistoriPemesanan>>> getListHistoriPemesanan();
  Future<Either<Failure, bool>> uploadBuktiPembayaran(
      {required int idTransaksi, required XFile urlBukti});
}

class HistoriPemesananRemoteDataSourceImpl
    implements HistoriPemesananRemoteDataSource {
  @override
  Future<Either<Failure, List<HistoriPemesanan>>>
      getListHistoriPemesanan() async {
    try {
      final response = await Request().get(
        listHistoryPemesanan,
      );
      List<HistoriPemesanan> history = [];
      if (response.statusCode == 200) {
        for (var value in response.data) {
          final result = HistoriPemesanan.fromJson(value);
          history.add(result);
        }
        return Right(history);
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
  Future<Either<Failure, bool>> uploadBuktiPembayaran(
      {required int idTransaksi, required XFile urlBukti}) async {
    try {
      final formData = FormData.fromMap({
        'id_transaksi': idTransaksi,
        'url_bukti': await MultipartFile.fromFile(
          urlBukti.path,
          filename: urlBukti.path.split('/').last,
        ),
      });

      final response = await Request().post(
        uploadBukti,
        data: formData,
      );

      if (response.statusCode == 201) {
        return const Right(true);
      }
      return Left(ConnectionFailure(
          response.data['message'] ?? 'Gagal mengunggah bukti pembayaran'));
    } on DioException catch (e) {
      return Left(ParsingFailure(e.toString()));
    }
  }
}
