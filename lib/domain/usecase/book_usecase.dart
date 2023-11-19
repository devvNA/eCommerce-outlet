import 'package:dartz/dartz.dart';

import '../../core/types.dart';
import '../../core/networking/failure.dart';
import '../repositories/book_repository.dart';

class BookUseCase {
  BookRepository repository;

  BookUseCase({
    required this.repository,
  });

  Future<Either<Failure, ListBook>> getListBook(int page, int limit) async {
    return await repository.getListBook(page, limit);
  }
}
