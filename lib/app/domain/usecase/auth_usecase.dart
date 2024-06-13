import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/domain/repositories/auth_repository.dart';

import '../../core/networking/failure_helper.dart';

class AuthUseCase {
  AuthRepository repository;

  AuthUseCase({
    required this.repository,
  });

  // Future<Either<Failure, bool>> login(
  //     {required String email, required String password}) async {
  //   return await repository.login(email: email, password: password);
  // }

  // Future<Either<Failure, bool>> logout() async {
  //   return await repository.logout();
  // }

  Future<Either<Failure, String>> getFirebaseToken() async {
    return await repository.getFirebaseToken();
  }

  // Future<Either<Failure, List<UserInfo>>> getFirebaseProvider() async {
  //   return await repository.getFirebaseProvider();
  // }
}
