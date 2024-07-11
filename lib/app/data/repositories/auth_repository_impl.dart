import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasources.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  // @override
  // Future<Either<Failure, bool>> login(
  //         {required String email, required String password}) async =>
  //     await remoteDataSource.login(email: email, password: password);

  // @override
  // Future<Either<Failure, bool>> logout() async =>
  //     await remoteDataSource.logout();
  @override
  Future<Either<Failure, String>> googleLogin() async =>
      await remoteDataSource.googleLogin();

  // @override
  // Future<Either<Failure, List<UserInfo>>> getFirebaseProvider() async =>
  //     await remoteDataSource.getFirebaseProvider();
}
