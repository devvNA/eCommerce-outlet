// ignore_for_file: deprecated_member_use, avoid_print, unused_element

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:marvelindo_outlet/core/api_endpoints.dart';
import 'package:marvelindo_outlet/core/utils/local/token_cache.dart';
import 'package:marvelindo_outlet/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/data/repositories/auth_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/auth_usecase.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'compare_time_helper.dart';
import 'types.dart';

class Request {
  late Dio _dio = Dio();

  Request() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
    _dio.interceptors.add(PrettyDioLogger());

/*     _dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioError e, handler) {
            print(e.response);
            if (e.response?.statusCode == 401) {
              print('======== UNAUTHORIZED ========');
            }
            return handler.next(e);
          },
          onResponse: (e, handler) {
            if (e.statusCode == 401) {
              // _handleUnauthorized();
            }
            return handler.next(e);
          },
        ),
      );
 */
  }

  /// Fungsi ini digunakan untuk memperbarui header authorization
  void updateAuthorization(String token) {
    _dio.options.headers['authorization'] = 'Bearer $token';
  }

  /// GET request
  Future<Response> get(String endpoint,
      {JSON? queryParameters, required bool requiresAuthToken}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.get(endpoint, queryParameters: queryParameters);
  }

  /// POST request
  Future<Response> post(String endpoint,
      {Object? body,
      JSON? queryParameters,
      required bool requiresAuthToken}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.post(endpoint,
        queryParameters: queryParameters, data: body);
  }

  /// DELETE request
  Future<Response> delete(String endpoint,
      {Object? body, required bool requiresAuthToken}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.delete(endpoint, data: body);
  }

  /// PUT request
  Future<Response> put(String endpoint,
      {Object? body,
      JSON? queryParameters,
      required bool requiresAuthToken}) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.put(endpoint,
        data: body, queryParameters: queryParameters);
  }

  Future<void> _setFirebaseToken() async {
    var response = await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .getFirebaseToken();
    response.fold((failure) => throw Exception(failure.message),
        (firebaseToken) => updateAuthorization(firebaseToken));
  }

  Future<String?> _getAccessToken() async {
    const expiredTime = Duration(hours: 23);

    final token =
        await Get.find<TokenCacheService>().getTokenFromLocalStorage();

    if (token != null) {
      final tokenTime = token.tokenTime != null
          ? DateTime.parse(token.tokenTime!)
          : DateTime.now();
      final expired = isExpired(tokenTime, expiredTime);
      if (expired) {
        // updateAuthorization(token.accessToken);
        // final result =
        //     await Get.find<AuthUseCase>().refreshToken(token.refreshToken);
        // if (result.isRight()) {
        //   final newToken = result.getOrElse(() => const Token());

        //   await Get.find<TokenCacheService>().saveTokenToLocalStorage(newToken);

        //   return newToken.accessToken;
        // }
      }
    }

    return token?.accessToken;
  }
}
