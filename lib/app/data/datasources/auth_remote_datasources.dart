import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/data/repositories/auth_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/auth_usecase.dart';

import '../../core/api_endpoints.dart';
import '../../core/networking/failure_helper.dart';
import '../../core/networking/network_request.dart';
import '../models/outlet_model.dart';

abstract class AuthRemoteDataSource {
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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final box = GetStorage();

  @override
  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Request().post(
        loginUrl,
        requiresAuthToken: false,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        box.write("TOKEN", response.data["token"]);
        log("Token : ${box.read("TOKEN")}");
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      return Left(ParsingFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      var response = await Request().post(
        logoutUrl,
        requiresAuthToken: true,
      );
      if (response.statusCode == 200) {
        return const Right(true);
      }
      return const Left(ParsingFailure("Kesalahan Parsing"));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Outlet>> getUser() async {
    try {
      final request = Request();

      var response = await request.get(getUserLink, requiresAuthToken: true);
      Outlet? user;
      if (response.statusCode == 200) {
        user = Outlet.fromJson(response.data);
        return Right(user);
      }
      return const Left(ParsingFailure("Kesalahan Parsing"));
    } on DioException catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required String email,
    required String password,
    required String namaOutlet,
    required String alamatOutlet,
  }) async {
    try {
      final request = Request();

      final response = await request.post(
        registerUser,
        requiresAuthToken: false,
        data: {
          "email": email,
          "password": password,
          "nama_outlet": namaOutlet,
          "alamat_outlet": alamatOutlet
        },
      );
      if (response.statusCode == 201) {
        return Right(response.data["message"]);
      }
      return const Left(ParsingFailure("Kesalahan Parsing"));
    } on DioException catch (e) {
      return Left(Exception(e.response!.data["email"].toString()));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    try {
      final response = await Request().post(
        "refreshTokenUrl",
        requiresAuthToken: true,
      );
      if (response.statusCode == 200) {
        final newToken = response.data["TOKEN"];
        box.write("TOKEN", newToken);
        return Right(newToken);
      }
      return const Left(ConnectionFailure('Gagal memperbarui token'));
    } catch (e) {
      return Left(ParsingFailure(e.toString()));
    }
  }
  
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

class UserManager {
  static final UserManager _instance = UserManager._internal();

  factory UserManager() {
    return _instance;
  }

  UserManager._internal();

  Outlet? _currentOutlet;

  Outlet? get currentOutlet => _currentOutlet;

  loadUserData() async {
    final response = await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .getUser();

    response.fold(
        (failure) => log(failure.message), (user) => _currentOutlet = user);
  }
}
