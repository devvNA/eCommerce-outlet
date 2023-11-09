import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/failure.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, String>> getFirebaseToken();
  // Future<Either<Failure, Token>> refreshToken(String refreshToken);
  Future<Either<Failure, List<UserInfo>>> getFirebaseProvider();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, String>> getFirebaseToken() async {
    try {
      final auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user == null) return const Left(Exception('unauthenticated'));

      String? firebaseToken = await user.getIdToken();
      return Right(firebaseToken ?? "null");
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserInfo>>> getFirebaseProvider() async {
    try {
      final auth = FirebaseAuth.instance;
      User? user = auth.currentUser;

      if (user == null) {
        return const Left(Exception('unauthenticated'));
      }

      final providerData = auth.currentUser!.providerData;
      return Right(providerData);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
  // @override
  // Future<Either<Failure, Token>> refreshToken(
  //     String refreshToken) async {
  //   try {
  //     final Request request = Get.find()<Request>();

  //     final body = {"refresh_token": refreshToken};

  //     final response = await request.post(refreshTokenUrl,
  //         data: body, requiresAuthToken: false);

  //     if (response.statusCode == 200) {
  //       final token = Token.fromJson(response.data);
  //       return Right(token);
  //     }

  //     return Left(ConnectionFailure(response.data['message']));
  //   } on DioError catch (_) {
  //     return const Left(ConnectionFailure('Terjadi kesalahan.'));
  //   } catch (_) {
  //     return const Left(ParsingFailure('Tidak dapat memparsing respon'));
  //   }
  // }
}
