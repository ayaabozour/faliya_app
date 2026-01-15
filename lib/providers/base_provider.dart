import 'dart:io';
import 'package:flutter/material.dart';
import '../services/network/api_service.dart';

class BaseProvider extends ChangeNotifier {
  final ApiService api;

  BaseProvider(this.api);

  bool isLoading = false;
  String? error;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    error = message;
    notifyListeners();
  }

  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
