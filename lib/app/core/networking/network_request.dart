// ignore_for_file: deprecated_member_use, avoid_print, unused_element
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../data/datasources/auth_remote_datasources.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../utils/api_endpoints.dart';
import '../utils/helpers/types.dart';

class Request {
  Dio _dio = Dio();
  final box = GetStorage();

  Request() {
    _dio = Dio(
      BaseOptions(
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        persistentConnection: true,
        receiveDataWhenStatusError: true,
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );
    _dio.options.sendTimeout = const Duration(seconds: 20);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      // responseHeader: true,
      maxWidth: 95,
    ));
  }

  /// Fungsi ini digunakan untuk memperbarui header authorization
  void updateAuthorization(String token) {
    token = box.read("accessToken") ?? "null";
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// GET request
  Future<Response> get(String endpoint,
      {JSON? queryParameters,
      required bool requiresAuthToken,
      Object? data}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  /// POST request
  Future<Response> post(String endpoint,
      {JSON? queryParameters,
      required bool requiresAuthToken,
      Object? data}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  /// DELETE request
  Future<Response> delete(String endpoint,
      {required bool requiresAuthToken, Object? data}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.delete(endpoint);
  }

  /// PUT request
  Future<Response> put(String endpoint,
      {JSON? queryParameters,
      required bool requiresAuthToken,
      Object? data}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  // ========================================================================== //

  Future<void> _setFirebaseToken() async {
    var response = await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .getFirebaseToken();
    response.fold((failure) => throw Exception(failure.message),
        (firebaseToken) => updateAuthorization(firebaseToken));
  }

  // Future<String?> _getAccessToken() async {
  //   const expiredTime = Duration(hours: 23);

  //   final token =
  //       await Get.find<TokenCacheService>().getTokenFromLocalStorage();

  //   if (token != null) {
  //     final tokenTime = token.tokenTime != null
  //         ? DateTime.parse(token.tokenTime!)
  //         : DateTime.now();
  //     final expired = isExpired(tokenTime, expiredTime);
  //     if (expired) {
  //       // updateAuthorization(token.accessToken);
  //       // final result =
  //       //     await Get.find<AuthUseCase>().refreshToken(token.refreshToken);
  //       // if (result.isRight()) {
  //       //   final newToken = result.getOrElse(() => const Token());

  //       //   await Get.find<TokenCacheService>().saveTokenToLocalStorage(newToken);

  //       //   return newToken.accessToken;
  //       // }
  //     }
  //   }

  //   return token?.accessToken;
  // }
}
