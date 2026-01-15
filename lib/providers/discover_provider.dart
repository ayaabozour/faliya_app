import 'dart:async';
import 'package:flutter/material.dart';
import 'base_provider.dart';

class DiscoverProvider extends BaseProvider {
  final PageController pageController = PageController(viewportFraction: 0.9);

  int currentIndex = 0;
  bool isUserInteracting = false;
  Timer? autoScrollTimer;

  final List<Map<String, String>> trendingEvents = [
    {
      'title': 'Tech Conference 2026',
      'image': 'https://images.unsplash.com/photo-1521737604893-d14cc237f11d',
    },
    {
      'title': 'Music Festival Night',
      'image': 'https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2',
    },
    {
      'title': 'Startup Pitch Event',
      'image': 'https://images.unsplash.com/photo-1551836022-d5d88e9218df',
    },
  ];

  List<int> upcomingEvents = [];

  DiscoverProvider(super.api) {
    init();
  }

  Future<void> init() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    upcomingEvents = List.generate(5, (_) => 0);

    isLoading = false;
    notifyListeners();

    startAutoScroll();
  }

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onUserScroll(bool scrolling) {
    isUserInteracting = scrolling;
  }

  void startAutoScroll() {
    autoScrollTimer?.cancel();
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!isUserInteracting && pageController.hasClients) {
        final next = (currentIndex + 1) % trendingEvents.length;
        pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
