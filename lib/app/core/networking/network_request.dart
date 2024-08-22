// ignore_for_file: deprecated_member_use, avoid_print, unused_element, unused_import
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/custom_snackbar.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';
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
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        contentType: "application/json",
      ),
    );
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String? token = box.read("TOKEN");
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final newToken = await refreshToken();
          if (newToken != null) {
            error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            box.write("TOKEN", newToken);
            return handler.resolve(await _dio.fetch(error.requestOptions));
          }
          await box.remove("TOKEN");
          CustomSnackBar.showCustomErrorSnackBar(
            title: "Perhatian",
            message: "Sesi telah berakhir, silahkan login kembali",
          );
          getx.Get.offAllNamed(Routes.LOGIN);
        }
        return handler.next(error);
      },
    ));

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      maxWidth: 95,
    ));
  }

  /// GET request
  Future<Response> get(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  /// POST request
  Future<Response> post(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  /// DELETE request
  Future<Response> delete(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.delete(endpoint);
  }

  /// PUT request
  Future<Response> put(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<String?> refreshToken() async {
    try {
      final request = Request();
      final response = await request.post(
        refreshTokenUrl,
      );

      if (response.statusCode == 200) {
        String newAccessToken = response.data['token'];
        await box.write("TOKEN", newAccessToken);
        return newAccessToken;
      } else {
        await box.remove("TOKEN");
        CustomSnackBar.showCustomErrorSnackBar(
          title: "Perhatian",
          message: "Sesi telah berakhir, silahkan login kembali",
        );
        getx.Get.offAllNamed(Routes.LOGIN);
        throw Exception("Gagal melakukan refresh token");
      }
    } on DioException catch (e) {
      log("Error saat refresh token: $e");
      return null;
    }
  }
}
