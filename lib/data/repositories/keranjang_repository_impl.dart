import 'package:dartz/dartz.dart';

import 'package:marvelindo_outlet/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/data/datasources/keranjang_remote_datasources.dart';
import 'package:marvelindo_outlet/data/models/keranjang/keranjang_model.dart';
import 'package:marvelindo_outlet/domain/repositories/keranjang_repository.dart';

class KeranjangRepositoryImpl implements KeranjangRepository {
  final KeranjangRemoteDataSource remoteDataSource;

  KeranjangRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Keranjang>>> getListKeranjang() async =>
      await remoteDataSource.getListKeranjang();
}
