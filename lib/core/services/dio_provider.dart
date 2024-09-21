import 'package:bookia_store_app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioProvider {
  // one instance of dio
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      //connectTimeout: const Duration(seconds: 30),
      //receiveTimeout: const Duration(seconds: 30),
    ));
  }

  // handle Dio method

  static Future<Response> get(
      {required String endPoint, Map<String, dynamic>? headers}) {
    return dio.get(
      endPoint,
      options: Options(
        headers: headers,
      ),
    );
  }

  static Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.post(
      endPoint,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }

  static Future<Response> put({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    return dio.put(
      endPoint,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }

  static Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      endPoint,
      options: Options(
        headers: headers,
      ),
    );
  }
}
