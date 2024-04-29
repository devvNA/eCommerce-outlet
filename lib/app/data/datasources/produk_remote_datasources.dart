// ignore_for_file: deprecated_member_use
import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';
import '../../core/utils/api_endpoints.dart';
import '../models/produk/produk_model.dart';

abstract class ProdukRemoteDataSource {
  Future<Either<Failure, List<Produk>>> getAllProduk();
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      String kategori);
  Future<Either<Failure, String>> addToCart({required int id,required Produk produk});
}

class ProdukRemoteDataSourceImpl implements ProdukRemoteDataSource {
  @override
  Future<Either<Failure, List<Produk>>> getAllProduk() async {
    try {
      final response =
          await Request().get(listProduk, requiresAuthToken: false);

      List<Produk> products = [];
      if (response.statusCode == 200) {
        // debugPrint('Status: ${response.statusMessage}');
        for (var value in response.data["data"]) {
          final result = Produk.fromJson(value);
          products.add(result);
        }
        return Right(products);
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
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      String kategori) async {
    try {
      final response = await Request().get(
        "$listProdukByCategory/$kategori",
        requiresAuthToken: true,
      );

      List<Produk> products = [];
      if (response.statusCode == 200) {
        for (var value in response.data['data']) {
          final result = Produk.fromJson(value);
          products.add(result);
        }
        return Right(products);
      } else {}

      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      //error parsing json
      return Left(ParsingFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addToCart(
      {required int id, required Produk produk}) async {
    try {
      final query = {
        'id_user': id,
        'id_produk': produk.id,
      };

      final response = await Request().post(
        postKeranjang,
        requiresAuthToken: true,
        queryParameters: query,
      );
      return Right(response.data["message"]);
    } catch (e) {
      //error parsing json
      return Left(ParsingFailure(e.toString()));
    }
  }
}
