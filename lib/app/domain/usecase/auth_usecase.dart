import 'package:dartz/dartz.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/domain/repositories/auth_repository.dart';

import '../../data/models/outlet_model.dart';

class AuthUseCase {
  AuthRepository repository;

  AuthUseCase({
    required this.repository,
  });

  Future<Either<Failure, bool>> login(
          {required String email, required String password}) async =>
      await repository.login(email: email, password: password);

  Future<Either<Failure, bool>> logout() async => await repository.logout();

  Future<Either<Failure, Outlet>> getUser() async => await repository.getUser();

  Future<Either<Failure, String>> register({
    required String email,
    required String password,
    required String namaOutlet,
    required String alamatOutlet,
  }) async =>
      await repository.register(
          email: email,
          password: password,
          namaOutlet: namaOutlet,
          alamatOutlet: alamatOutlet);

  Future<Either<Failure, String>> refreshToken() async =>
      await repository.refreshToken();
}
