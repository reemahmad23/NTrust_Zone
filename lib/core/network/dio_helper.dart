
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://trustzone.azurewebsites.net/",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  // POST Request
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers['Authorization'] = token ?? '';
      final response = await dio.post(url, data: data, queryParameters: query);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // GET Request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers['Authorization'] = token ?? '';
      final response = await dio.get(url, queryParameters: query);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // PUT Request
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers['Authorization'] = token ?? '';
      final response = await dio.put(url, data: data, queryParameters: query);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // DELETE Request
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers['Authorization'] = token ?? '';
      final response = await dio.delete(url, data: data, queryParameters: query);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // Handle errors (private method)
  static void _handleDioError(DioException e) {
    if (e.response != null) {
      print('Error StatusCode: ${e.response?.statusCode}');
      print('Error Data: ${e.response?.data}');
      print('Error Headers: ${e.response?.headers}');
    } else {
      print('Error sending request!');
      print('Message: ${e.message}');
    }
  }
}
