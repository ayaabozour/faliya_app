import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/enums/account_type.dart';

class SharedPrefsProvider extends ChangeNotifier {
  static final SharedPrefsProvider instance = SharedPrefsProvider._internal();

  SharedPrefsProvider._internal();

  late SharedPreferences prefs;

  static const userTypeKey = 'userTypeKey';
  static const tokenKey = 'tokenKey';
  static const refreshTokenKey = 'refreshTokenKey';
  static const darkModeKey = 'darkModeKey';
  static const firstOpenKey = 'firstOpenKey';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get isFirstOpen => prefs.getBool(firstOpenKey) ?? true;
  Future<void> setFirstOpen(bool value) async {
    await prefs.setBool(firstOpenKey, value);
    notifyListeners();
  }

  AccountType get userType {
    final value = prefs.getString(userTypeKey) ?? AccountType.attender.value;
    return AccountTypeExtension.fromValue(value);
  }

  Future<void> setUserType(AccountType type) async {
    await prefs.setString(userTypeKey, type.value);
    notifyListeners();
  }

  String get accessToken => prefs.getString(tokenKey) ?? '';
  String get refreshToken => prefs.getString(refreshTokenKey) ?? '';

  Future<void> setTokens({required String accessToken, required String refreshToken}) async {
    await prefs.setString(tokenKey, accessToken);
    await prefs.setString(refreshTokenKey, refreshToken);
    notifyListeners();
  }

  Future<void> clearTokens() async {
    await prefs.remove(tokenKey);
    await prefs.remove(refreshTokenKey);
    notifyListeners();
  }

  bool get isDarkMode => prefs.getBool(darkModeKey) ?? false;
  Future<void> setDarkMode(bool value) async {
    await prefs.setBool(darkModeKey, value);
    notifyListeners();
  }

  Future<void> clear() async {
    await prefs.clear();
    notifyListeners();
  }
}
