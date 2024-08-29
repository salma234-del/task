import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    debugPrint('dio service run');
    dio = Dio(BaseOptions(
        validateStatus: (_) => true,
        baseUrl: 'https://generativelanguage.googleapis.com',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return dio!.get(
      url,
      queryParameters: query,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }

  static Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return dio!.post(
      url,
      data: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }
}
