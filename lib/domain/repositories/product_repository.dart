import 'package:dartz/dartz.dart';

import '../../core/types.dart';
import '../../core/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ListProduct>> getListProduct();
}
