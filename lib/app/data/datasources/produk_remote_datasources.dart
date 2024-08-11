import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/network_request.dart';

import '../../core/api_endpoints.dart';
import '../../core/networking/failure_helper.dart';
import '../models/produk_model.dart';

abstract class ProdukRemoteDataSource {
  Future<Either<Failure, List<Produk>>> getAllProduk();
  Future<Either<Failure, List<Produk>>> getListProductByCategory(
      {required String kategori});
  Future<Either<Failure, String>> addToCart(
      {required int idUser, required Produk produk});
  Future<Either<Failure, List<String>>> getCategoryList();
}

class ProdukRemoteDataSourceImpl implements ProdukRemoteDataSource {
  final request = Request();

  @override
  Future<Either<Failure, List<Produk>>> getAllProduk() async {
    try {
      final response = await request.get(
        listProduk,
        requiresAuthToken: true,
      );

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
      {required String kategori}) async {
    try {
      final response = await request.get(
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
      {required int idUser, required Produk produk}) async {
    try {
      final query = {
        'id_user': idUser,
        'id_produk': produk.id,
      };

      final response = await request.post(
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

  @override
  Future<Either<Failure, List<String>>> getCategoryList() async {
    try {
      final response = await request.get(
        listKategori,
        requiresAuthToken: true,
      );

      List<String> categories = [];
      if (response.statusCode == 200) {
        for (var value in response.data) {
          categories.add(value);
        }
        return Right(categories);
      }
      return Left(ConnectionFailure(response.data['message']));
    } catch (e) {
      //error parsing json
      return Left(ParsingFailure(e.toString()));
    }
  }
}
