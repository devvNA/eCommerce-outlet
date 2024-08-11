import 'package:dartz/dartz.dart';
import '../../core/networking/failure_helper.dart';
import '../../data/models/outlet_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, Outlet>> getUser();
  Future<Either<Failure, String>> register({
    required String email,
    required String password,
    required String namaOutlet,
    required String alamatOutlet,
  });
  Future<Either<Failure, String>> refreshToken();
}
