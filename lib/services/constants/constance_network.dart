import 'package:show_up_app/models/enums/token_type.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';

abstract class NetworkConstants {
  //TODO: add base url
  static const baseUrl = "";

  static const login = "login";
  static const register = "register";
  static const logout = "logout";
  static const getProfile = "profile";

  static Map<String, String> headers(TokenType token) {
    final auth = 'Bearer ${SharedPrefsProvider.tokenKey}'; 
    //TODO: make sure of it and convert it into private

    switch (token) {
      case TokenType.contentType:
        return {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': auth,
        };

      case TokenType.multipart:
        return {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
          'Authorization': auth,
        };

      default:
        return {
          'Accept': 'application/json',
          'Authorization': auth,
        };
    }
  }
}
