// ignore_for_file: deprecated_member_use, avoid_print, unused_element, unused_import
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/refresh_token_controller.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api_endpoints.dart';
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
        // connectTimeout: const Duration(seconds: 50),
        // receiveTimeout: const Duration(seconds: 50),
        // sendTimeout: const Duration(seconds: 50),
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );
    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       final tokenService = getx.Get.find<TokenService>();
    //       final token = await tokenService.getValidToken();
    //       if (token != null) {
    //         options.headers['Authorization'] = 'Bearer $token';
    //       }
    //       return handler.next(options);
    //     },
    //   ),
    // );
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      maxWidth: 95,
    ));
  }

  /// Fungsi ini digunakan untuk memperbarui header authorization
  void updateAuthorization(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// GET request
  Future<Response> get(String endpoint,
      {JSON? queryParameters,
      required bool requiresAuthToken,
      Object? data}) async {
    if (requiresAuthToken) await _getToken();
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
    if (requiresAuthToken) await _getToken();
    return await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  /// DELETE request
  Future<Response> delete(String endpoint,
      {required bool requiresAuthToken, Object? data}) async {
    if (requiresAuthToken) await _getToken();
    return await _dio.delete(endpoint);
  }

  /// PUT request
  Future<Response> put(String endpoint,
      {JSON? queryParameters,
      required bool requiresAuthToken,
      Object? data}) async {
    if (requiresAuthToken) await _getToken();
    return await _dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  // ========================================================================== //

  // Future<void> _setFirebaseToken() async {
  //   var response = await AuthUseCase(
  //           repository: AuthRepositoryImpl(
  //               remoteDataSource: AuthRemoteDataSourceImpl()))
  //       .getFirebaseToken();
  //   response.fold((failure) => throw Exception(failure.message),
  //       (firebaseToken) => updateAuthorization(firebaseToken));
  // }

  // ========================================================================== //

  Future<void> _getToken() async {
    String getToken = await box.read("TOKEN");
    return updateAuthorization(getToken);
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
