// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/networking/failure.dart';
import '../../core/api_endpoints.dart';
import '../../core/networking/network_request.dart';
import '../models/book/book_model.dart';

import '../../core/types.dart';

abstract class BookRemoteDataSource {
  Future<Either<Failure, ListBook>> getListBook(int page, int limit);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  @override
  Future<Either<Failure, ListBook>> getListBook(int page, int limit) async {
    try {
      final request = Request();

      // final response = await Dio().get(bookUrl);
      final response = await request.get("$listBooks?page=$page&limit=$limit",
          requiresAuthToken: true);

      ListBook books = [];
      if (response.statusCode == 200) {
        // debugPrint('Status: ${response.statusMessage}');
        for (var value in response.data["books"]) {
          final result = Book.fromJson(value);
          books.add(result);
        }
        return Right(books);
      }
      // debugPrint('Data: ${response.data}');
      return Left(ConnectionFailure(response.data['message']));
    } on DioError catch (_) {
      return const Left(ConnectionFailure("Terjadi Kesalahan"));
    } catch (_) {
      return const Left(ParsingFailure("Tidak dapat memparsing respon"));
    }
  }
}
