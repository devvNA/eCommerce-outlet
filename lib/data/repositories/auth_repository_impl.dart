import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasources.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> getFirebaseToken() async =>
      await remoteDataSource.getFirebaseToken();
      
  @override
  Future<Either<Failure, List<UserInfo>>> getFirebaseProvider() async =>
      await remoteDataSource.getFirebaseProvider();
}
