import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/data/models/histori_pemesanan_model.dart';

import '../../core/api_endpoints.dart';
import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';

abstract class HistoriPemesananRemoteDataSource {
  Future<Either<Failure, List<HistoriPemesanan>>> getListHistoriPemesanan();
}

class HistoriPemesananRemoteDataSourceImpl
    implements HistoriPemesananRemoteDataSource {
  @override
  Future<Either<Failure, List<HistoriPemesanan>>>
      getListHistoriPemesanan() async {
    try {
      final response = await Request().get(
        listHistoryPemesanan,
        requiresAuthToken: false,
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
}
