import 'package:dartz/dartz.dart';

import '../../core/types.dart';
import '../../core/networking/failure.dart';

abstract class BookRepository {
  Future<Either<Failure, ListBook>> getListBook(int page, int limit);
}