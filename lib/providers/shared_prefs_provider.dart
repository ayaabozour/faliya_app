import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_app/models/enums/account_type.dart';

class SharedPrefsProvider extends ChangeNotifier {
  SharedPreferences? prefs;

  static const String userTypeKey = "userTypeKey";
  static const String tokenKey = "tokenKey";
  static const String darkModeKey = "isDarkMode";
  static const String firstOpenKey = "firstOpen";

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  bool get isFirstOpen => prefs?.getBool(firstOpenKey) ?? true;
  Future<void> setFirstOpen(bool value) async {
    await prefs?.setBool(firstOpenKey, value);
    notifyListeners();
  }

  AccountType get userType {
    final value = prefs?.getString(userTypeKey) ?? 'attender';
    return AccountTypeExtension.fromValue(value);
  }

  Future<void> setUserType(AccountType type) async {
    await prefs?.setString(userTypeKey, type.value);
    notifyListeners();
  }

  String get token => prefs?.getString(tokenKey) ?? '';
  Future<void> setToken(String value) async {
    await prefs?.setString(tokenKey, value);
    notifyListeners();
  }

  bool get isDarkMode => prefs?.getBool(darkModeKey) ?? false;
  Future<void> setDarkMode(bool value) async {
    await prefs?.setBool(darkModeKey, value);
    notifyListeners();
  }

  Future<void> clearAll() async {
    await prefs?.clear();
    notifyListeners();
  }
}
