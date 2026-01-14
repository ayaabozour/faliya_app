import 'package:dio/dio.dart';
import 'package:show_up_app/services/constants/constance_network.dart';
import 'api_interceptors.dart';

class DioFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
      ),
    );

    dio.interceptors.add(ApiInterceptors());
    return dio;
  }
}
