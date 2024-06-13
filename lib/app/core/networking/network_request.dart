// ignore_for_file: deprecated_member_use, avoid_print, unused_element
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/datasources/auth_remote_datasources.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../api_endpoints.dart';
import '../utils/helpers/types.dart';

class Request {
  final box = GetStorage();
  final _dio = Dio(
    BaseOptions(
      // headers: {HttpHeaders.contentTypeHeader: "application/json"},
      persistentConnection: true,
      receiveDataWhenStatusError: true,
      contentType: "application/json",
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  );

  Request() {
    _dio.httpClientAdapter = HttpClientAdapter();
    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) async {
    //     options.headers["Accept"] = "application/json";
    //     String? token = box.read("token");
    //     options.headers['Authorization'] = "Bearer $token";
    //     return handler.next(options);
    //   },
    //   onError: (error, handler) async {
    //     if (error.response?.statusCode == 401) {
    //       // final newAccessToken = await refreshToken();
    //       // if (newAccessToken != null) {
    //       //   _dio.options.headers['Authorization'] = "Bearer $newAccessToken";
    //       //   return handler.resolve(await _dio.fetch(error.requestOptions));
    //       // }
    //       return handler.resolve(await _dio.fetch(error.requestOptions));
    //     }
    //     return handler.next(error);
    //   },
    // ));
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      maxWidth: 95,
    ));
  }

  // Future<String?> refreshToken() async {
  //   try {
  //     final refreshToken = box.read("token");
  //     final response = awa
  //   } catch (e) {}
  //   return null;
  // }

  /// Fungsi ini digunakan untuk memperbarui header authorization
  updateAuthorization(String token) async {
    token = box.read("accessToken");
    // token = box.read("token");
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  /// GET request
  Future<Response> get(
    String endpoint, {
    JSON? queryParameters,
    required bool requiresAuthToken,
    Object? body,
  }) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  /// POST request
  Future<Response> post(
    String endpoint, {
    JSON? queryParameters,
    required bool requiresAuthToken,
    Object? body,
  }) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  /// DELETE request
  Future<Response> delete(
    String endpoint, {
    required bool requiresAuthToken,
    Object? body,
    JSON? queryParameters,
  }) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.delete(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  /// PUT request
  Future<Response> put(
    String endpoint, {
    JSON? queryParameters,
    required bool requiresAuthToken,
    Object? body,
  }) async {
    if (requiresAuthToken) await _setFirebaseToken();
    return await _dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  // ========================================================================== //

  // Future<void> _setToken() async {
  //   String getToken = box.read("token");
  //   updateAuthorization(getToken);
  // }

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
