import 'dart:io';
import 'package:flutter/foundation.dart';
import '../services/network/api_service.dart';

class BaseProvider with ChangeNotifier {
  final ApiService apiService = ApiService();

  bool isLoading = false;
  bool failed = false;
  String? errorMessage;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setFailed(bool value, {String? message}) {
    failed = value;
    errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    failed = false;
    errorMessage = null;
    notifyListeners();
  }

  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
