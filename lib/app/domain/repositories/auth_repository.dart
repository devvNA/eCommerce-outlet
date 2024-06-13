import 'package:dartz/dartz.dart';

import '../../core/networking/failure_helper.dart';

abstract class AuthRepository {
  // Future<Either<Failure, bool>> login(
  //     {required String email, required String password});
  // Future<Either<Failure, bool>> logout();
  Future<Either<Failure, String>> getFirebaseToken();

  // Future<Either<Failure, List<UserInfo>>> getFirebaseProvider();
}
