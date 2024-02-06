import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/utils/types.dart';

abstract class BookRepository {
  Future<Either<Failure, ListBook>> getListBook(int page, int limit);
}