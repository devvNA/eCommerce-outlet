// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/core/utils/types.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';
import '../../core/utils/api_endpoints.dart';
import '../models/book/book_model.dart';


abstract class BookRemoteDataSource {
  Future<Either<Failure, ListBook>> getListBook(int page, int limit);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  @override
  Future<Either<Failure, ListBook>> getListBook(int page, int limit) async {
    try {
      final request = Request();

      // final response = await Dio().get(bookUrl);
      final response = await request.get("$listBooks?page=$page&limit=$limit");

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
    } catch (_) {
      return const Left(ParsingFailure("Tidak dapat memparsing respon"));
    }
  }
}
