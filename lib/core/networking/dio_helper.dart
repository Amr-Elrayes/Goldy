import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: DioEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout:    Duration(seconds: 20),
        receiveTimeout:    Duration(seconds: 20),
        headers: {"Accept" : "application/json" , "User-Agent" : "Mozilla/5.0"}
      ),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
