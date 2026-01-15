import 'package:flutter/material.dart';
import 'package:show_up_app/providers/base_provider.dart';

class OnboardingProvider extends BaseProvider {
  final PageController pageController = PageController();
  int currentIndex = 0;

  OnboardingProvider(super.api);

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void skip() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
