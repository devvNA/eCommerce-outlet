import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/data/models/outlet_model.dart';

import '../../core/networking/failure_helper.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasources.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> login(
          {required String email, required String password}) async =>
      await remoteDataSource.login(email: email, password: password);

  @override
  Future<Either<Failure, bool>> logout() async =>
      await remoteDataSource.logout();

  @override
  Future<Either<Failure, Outlet>> getUser() async =>
      await remoteDataSource.getUser();

  @override
  Future<Either<Failure, String>> register({
    required String email,
    required String password,
    required String namaOutlet,
    required String alamatOutlet,
  }) async =>
      await remoteDataSource.register(
          email: email,
          password: password,
          namaOutlet: namaOutlet,
          alamatOutlet: alamatOutlet);

  @override
  Future<Either<Failure, String>> refreshToken() async =>
      await remoteDataSource.refreshToken();
}
