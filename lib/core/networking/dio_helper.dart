import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constants.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: DioEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        // headers: {"Content-Type" : "application/json"}
      ),
    );
  }


  static Future<Response> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }


}