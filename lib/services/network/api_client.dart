import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);

  Future<Response> get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) =>
      _dio.get(
        url,
        queryParameters: query,
        options: Options(headers: headers),
      );

  Future<Response> post(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  }) =>
      _dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );
}
