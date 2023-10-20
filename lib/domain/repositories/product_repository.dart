import 'package:dartz/dartz.dart';

import '../../data/types.dart';
import '../failures/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ListProduct>> getListProduct();
}
