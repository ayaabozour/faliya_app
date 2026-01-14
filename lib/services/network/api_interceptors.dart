import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger().d(
      'REQUEST → ${options.method} ${options.path}\nDATA: ${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger().i(
      'RESPONSE → ${response.statusCode} ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Logger().e('ERROR → ${err.message}');
    super.onError(err, handler);
  }
}
