import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/data/models/keranjang/keranjang_model.dart';

import '../../core/networking/network_request.dart';
import '../../core/utils/api_endpoints.dart';

abstract class KeranjangRemoteDataSource {
  Future<Either<Failure, List<Keranjang>>> getListKeranjang();
}

class KeranjangRemoteDataSourceImpl implements KeranjangRemoteDataSource {
  @override
  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async {
    try {
      final response = await Request().get(listKeranjang);

      List<Keranjang> keranjang = [];
      if (response.statusCode == 200) {
        // debugPrint('Status: ${response.statusMessage}');
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
}
