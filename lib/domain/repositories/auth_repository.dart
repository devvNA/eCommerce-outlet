import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> getFirebaseToken();
  Future<Either<Failure, List<UserInfo>>> getFirebaseProvider();
}
