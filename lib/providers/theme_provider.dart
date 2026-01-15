import 'package:flutter/material.dart';
import 'shared_prefs_provider.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPrefsProvider prefs;

  ThemeProvider(this.prefs);

  bool get isDarkMode => prefs.isDarkMode;

  Future<void> toggleTheme() async {
    await prefs.setDarkMode(!isDarkMode);
    notifyListeners();
  }
}
