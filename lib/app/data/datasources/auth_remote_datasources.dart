// ignore_for_file: unused_import

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/core/api_endpoints.dart';

import '../../core/networking/failure_helper.dart';
import '../../core/networking/firebase_auth_services.dart';
import '../../core/networking/network_request.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, String>> googleLogin();
  Future<void> googleLogout();
  // Future<Either<Failure, bool>> login(
  //     {required String email, required String password});
  // Future<Either<Failure, String>> getAccessToken();
  // Future<Either<Failure, Token>> refreshToken(String refreshToken);
  // Future<Either<Failure, List<UserInfo>>> getFirebaseProvider();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final box = GetStorage();

  // @override
  // Future<Either<Failure, bool>> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await Request().post(
  //       loginUrl,
  //       requiresAuthToken: false,
  //       queryParameters: {
  //         "email": email,
  //         "password": password,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       box.write("token", response.data["token"]);
  //       log("Token : ${box.read("token")}");
  //       return const Right(true);
  //     }
  //     return const Right(false);
  //   } catch (e) {
  //     return Left(ParsingFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, bool>> logout() async {
  //   try {
  //     var response = await Request().post(
  //       logoutUrl,
  //       requiresAuthToken: true,
  //     );
  //     box.remove("token");
  //     if (response.statusCode == 200) {
  //       // box.remove("token");
  //       log("Token : ${box.read("token")}");
  //       return const Right(true);
  //     }
  //     return const Right(false);
  //   } catch (e) {
  //     return Left(ParsingFailure(e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, String>> googleLogin() async {
    try {
      final auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user == null) return const Left(Exception('unauthenticated'));

      String? firebaseToken = await user.getIdToken();
      return Right(firebaseToken ?? "null");
    } on FirebaseAuthException catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<void> googleLogout() async {
    await FirebaseAuthServices.signOut();
    await box.erase();
  }

  // @override
  // Future<Either<Failure, List<UserInfo>>> getFirebaseProvider() async {
  //   try {
  //     final auth = FirebaseAuth.instance;
  //     User? user = auth.currentUser;

  //     if (user == null) {
  //       return const Left(Exception('unauthenticated'));
  //     }

  //     final providerData = auth.currentUser?.providerData ?? [];
  //     return Right(providerData);
  //   } on FirebaseAuthException catch (e) {
  //     return Left(Exception(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> getAccessToken() async {
  //   GoogleSignIn googleSignIn = GoogleSignIn(
  //     scopes: [
  //       'email',
  //     ],
  //   );
  //   try {
  //     GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //     GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     var userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     debugPrint("userCredential: $userCredential");
  //     debugPrint("userCredential: ${credential.accessToken}");

  //   } catch (e) {
  //     return;
  //   }
  // }
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
