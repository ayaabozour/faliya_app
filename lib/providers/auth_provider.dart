import 'package:show_up_app/providers/base_provider.dart';
import 'package:show_up_app/services/constants/constance_network.dart';
import '../models/enums/account_type.dart';
import '../models/enums/auth_status.dart';
import 'shared_prefs_provider.dart';

class AuthProvider extends BaseProvider {
  AuthStatus status = AuthStatus.firstOpen;

  AuthProvider(super.api) {
    checkAuthStatus();
  }

  void checkAuthStatus() {
    final prefs = SharedPrefsProvider.instance;

    if (prefs.isFirstOpen) {
      status = AuthStatus.firstOpen;
    } else if (prefs.accessToken.isEmpty) {
      status = AuthStatus.unauthenticated;
    } else {
      status = prefs.userType == AccountType.owner
          ? AuthStatus.authenticatedManager
          : AuthStatus.authenticatedUser;
    }

    notifyListeners();
  }

  Future<void> login({
    required String username,
    required String password,
    required AccountType type,
  }) async {
    setLoading(true);
    setError(null);

    try {
      final response = await api.client.post(
        NetworkConstants.ownerLogin,
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final accessToken = data['access_token']?.toString() ?? '';
        final refreshToken = data['refresh_token']?.toString() ?? '';

        await SharedPrefsProvider.instance.setTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        await SharedPrefsProvider.instance.setUserType(type);

        status = type == AccountType.owner
            ? AuthStatus.authenticatedManager
            : AuthStatus.authenticatedUser;
      } else {
        final errorMessage =
            response.data != null && response.data['message'] != null
            ? response.data['message'].toString()
            : 'Login failed. Please try again.';
        setError(errorMessage);
        status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      setError(e.toString());
      status = AuthStatus.unauthenticated;
    }

    setLoading(false);
    notifyListeners();
  }

  Future<void> attendeeLogin({
    required String username,
    required String password,
    required AccountType type,
  }) async {
    setLoading(true);
    setError(null);

    try {
      final response = await api.client.post(
        NetworkConstants.attendeeLogin,
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final accessToken = data['access_token']?.toString() ?? '';
        final refreshToken = data['refresh_token']?.toString() ?? '';

        await SharedPrefsProvider.instance.setTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        await SharedPrefsProvider.instance.setUserType(type);

        status = type == AccountType.owner
            ? AuthStatus.authenticatedManager
            : AuthStatus.authenticatedUser;
      } else {
        final errorMessage =
            response.data != null && response.data['message'] != null
            ? response.data['message'].toString()
            : 'Login failed. Please try again.';
        setError(errorMessage);
        status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      setError(e.toString());
      status = AuthStatus.unauthenticated;
    }

    setLoading(false);
    notifyListeners();
  }

  Future<void> logout() async {
    await SharedPrefsProvider.instance.clearTokens();
    status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
