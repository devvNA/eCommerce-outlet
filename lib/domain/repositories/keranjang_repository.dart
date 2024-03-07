import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/data/models/keranjang/keranjang_model.dart';

abstract class KeranjangRepository {
  Future<Either<Failure, List<Keranjang>>> getListKeranjang();
}
