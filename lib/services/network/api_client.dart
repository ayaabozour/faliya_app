import 'package:dio/dio.dart';

class ApiClient {
  ApiClient(this._dio);
  final Dio _dio;

  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
  }) =>
      _dio.get(url, options: Options(headers: headers), queryParameters: query);

  Future<Response> post(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) =>
      _dio.post(url, options: Options(headers: headers), data: body);

  Future<Response> put(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) =>
      _dio.put(url, options: Options(headers: headers), data: body);

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) =>
      _dio.delete(url, options: Options(headers: headers), data: body);

  Future<Response> download({
    required String url,
    required String savePath,
    required Map<String, dynamic> headers,
    dynamic body,
  }) =>
      _dio.download(
        url,
        savePath,
        data: body,
        options: Options(headers: headers),
      );
}
