import 'package:dartz/dartz.dart';

import '../../core/types.dart';
import '../../core/failure.dart';

abstract class BookRepository {
  Future<Either<Failure, ListBook>> getListBook(int page, int limit);
}