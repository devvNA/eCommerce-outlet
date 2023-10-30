// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:marvelindo_outlet/core/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'types.dart';

class Request {
  late Dio _dio = Dio();

  Request() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15), // 30 seconds
      receiveTimeout: const Duration(seconds: 15),
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
 */  }

  /// GET request
  Future<Response> get(String endpoint, {JSON? queryParameters}) async {
    return await _dio.get(endpoint, queryParameters: queryParameters);
  }

  /// POST request
  Future<Response> post(String endpoint,
      {Object? body, JSON? queryParameters}) async {
    return await _dio.post(endpoint, queryParameters: queryParameters, data: body);
  }

  /// DELETE request
  Future<Response> delete(String endpoint, {Object? body}) async {
    return await _dio.delete(endpoint, data: body);
  }

  /// PUT request
  Future<Response> put(String endpoint,
      {Object? body, JSON? queryParameters}) async {
    return await _dio.put(endpoint, data: body, queryParameters: queryParameters);
  }

/*   Future<Response> get(String endpoint,
      {JSON? queryParameters, required bool requiresAuthToken}) async {
    return await _dio.get(endpoint, queryParameters: queryParameters);
  }
 */

  void _initApiClient() {
    _dio = Dio(
        //   BaseOptions(
        //   headers: {
        //     // "x-api-key": apiKey,
        //     HttpHeaders.contentTypeHeader: "application/json",
        //   },
        //   responseType: ResponseType.json,
        // )
        );
    _dio.interceptors.add(PrettyDioLogger());

/*     BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "x-api-key": apiKey,
        HttpHeaders.contentTypeHeader: "application/json",
      },
      responseType: ResponseType.json,
    ); */
  }
}
