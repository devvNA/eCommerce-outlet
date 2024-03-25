import 'package:dartz/dartz.dart';
import '../../core/networking/failure_helper.dart';
import '../../data/models/keranjang/keranjang_model.dart';

abstract class KeranjangRepository {
  Future<Either<Failure, List<Keranjang>>> getListKeranjang();
  Future<Either<Failure, String>> deleteProdukKeranjang(int id);
}
