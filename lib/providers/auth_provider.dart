import 'package:flutter/material.dart';
import 'package:show_up_app/models/enums/account_type.dart';
import 'package:show_up_app/models/enums/auth_status.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';

class AuthProvider with ChangeNotifier {
  final SharedPrefsProvider sharedPrefs;

  AuthProvider({required this.sharedPrefs});

  AuthStatus status = AuthStatus.firstOpen;

  Future<void> checkAuthStatus() async {
    await sharedPrefs.initPrefs();

    if (sharedPrefs.isFirstOpen) {
      status = AuthStatus.firstOpen;
    } else if (sharedPrefs.token.isEmpty) {
      status = AuthStatus.unauthenticated;
    } else {
      if (sharedPrefs.userType == AccountType.owner) {
        status = AuthStatus.authenticatedManager;
      } else {
        status = AuthStatus.authenticatedUser;
      }
    }

    notifyListeners();
  }
}
