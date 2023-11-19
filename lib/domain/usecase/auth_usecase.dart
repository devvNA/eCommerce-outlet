import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/networking/failure.dart';
import '../repositories/auth_repository.dart';

class AuthUseCase {
  AuthRepository repository;

  AuthUseCase({
    required this.repository,
  });

  Future<Either<Failure, String>> getFirebaseToken() async {
    return await repository.getFirebaseToken();
  }

  Future<Either<Failure, List<UserInfo>>> getFirebaseProvider() async {
    return await repository.getFirebaseProvider();
  }
}
