import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';
import 'package:show_up_app/services/constants/constance_network.dart';

class ApiInterceptors extends Interceptor {
  final Dio _dio;
  final Logger _logger = Logger();

  bool _isRefreshing = false;

  ApiInterceptors(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = SharedPrefsProvider.instance.accessToken;

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Accept'] = 'application/json';

    _logger.d(
      'REQUEST → ${options.method} ${options.path}\n'
      'HEADERS: ${options.headers}\n'
      'DATA: ${options.data}',
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      'RESPONSE → ${response.statusCode} ${response.requestOptions.path}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    _logger.e('ERROR → ${err.response?.statusCode} ${err.requestOptions.path}');

    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final prefs = SharedPrefsProvider.instance;
    final refreshToken = prefs.refreshToken;

    if (refreshToken.isEmpty || _isRefreshing) {
      await prefs.clearTokens();
      return handler.next(err);
    }

    _isRefreshing = true;

    try {
      final refreshDio = Dio(BaseOptions(baseUrl: _dio.options.baseUrl));

      final response = await refreshDio.post(
        NetworkConstants.ownerRefresh,
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'Authorization': 'Bearer $refreshToken'}),
      );

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      await prefs.setTokens(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      );

      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      final retryResponse = await _dio.fetch(err.requestOptions);
      handler.resolve(retryResponse);
    } catch (_) {
      await prefs.clearTokens();
      handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }
}
