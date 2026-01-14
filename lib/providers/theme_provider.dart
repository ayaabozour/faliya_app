import 'package:flutter/material.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPrefsProvider sharedPrefs;

  ThemeProvider({required this.sharedPrefs});

  bool get isDarkMode => sharedPrefs.isDarkMode;

  void toggleTheme() {
    sharedPrefs.setDarkMode(!isDarkMode);
    notifyListeners();
  }
}
