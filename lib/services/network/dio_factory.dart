import 'package:dio/dio.dart';
import 'package:show_up_app/services/constants/constance_network.dart';
import 'package:show_up_app/services/network/api_interceptors.dart';

class DioFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: Headers.jsonContentType,
      ),
    );

    dio.interceptors.add(ApiInterceptors(dio));

    return dio;
  }
}
