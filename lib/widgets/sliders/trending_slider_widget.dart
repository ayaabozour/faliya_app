import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrendingEventsSlider extends StatelessWidget {
  final PageController pageController;
  final List<Map<String, String>> events;
  final int currentIndex;
  final Function(int) onPageChanged;
  final Function(bool) onUserScroll;

  const TrendingEventsSlider({
    super.key,
    required this.pageController,
    required this.events,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onUserScroll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              onUserScroll(notification.direction != ScrollDirection.idle);
              return false;
            },
            child: PageView.builder(
              controller: pageController,
              itemCount: events.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                final isActive = index == currentIndex;
                final event = events[index];

                return AnimatedScale(
                  scale: isActive ? 1 : 0.92,
                  duration: const Duration(milliseconds: 400),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(event['image']!, fit: BoxFit.cover),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                              child: Container(
                                color: Colors.black.withValues(alpha: 0.15),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: 0.75),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 20,
                            child: Text(
                              event['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(events.length, (index) {
            final active = index == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: active ? 28 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: active ? Colors.black : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}
