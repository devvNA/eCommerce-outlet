import 'package:dartz/dartz.dart';

import '../../data/types.dart';
import '../failures/failure.dart';

abstract class BookRepository {
  Future<Either<Failure, ListBook>> getListBook(int page, int limit);
}