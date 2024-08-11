import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/auth_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/auth_usecase.dart';

class TokenService extends GetxService {
  final box = GetStorage();

  void init() async {
    getValidToken();
    refreshToken();
  }

  Future<String?> getValidToken() async {
    final token = box.read("TOKEN");
    final tokenTime = box.read("TOKEN_TIME");

    if (token != null && tokenTime != null) {
      final tokenDateTime = DateTime.parse(tokenTime);
      final now = DateTime.now();
      final difference = now.difference(tokenDateTime);

      if (difference.inHours >= 23) {
        // Token sudah hampir kadaluarsa, lakukan refresh
        final result = await refreshToken();
        return result.fold(
          (failure) => null,
          (newToken) => newToken,
        );
      }
      return token;
    }
    return null;
  }

  Future<Either<Failure, String>> refreshToken() async {
    final authUseCase = AuthUseCase(
      repository: AuthRepositoryImpl(
        remoteDataSource: AuthRemoteDataSourceImpl(),
      ),
    );
    final result = await authUseCase.refreshToken();
    result.fold(
      (failure) => null,
      (newToken) {
        box.write("TOKEN", newToken);
        box.write("TOKEN_TIME", DateTime.now().toIso8601String());
      },
    );
    return result;
  }
}
