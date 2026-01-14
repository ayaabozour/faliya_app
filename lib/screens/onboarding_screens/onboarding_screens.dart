import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/providers/onboarding_provider.dart';
import 'package:show_up_app/screens/auth_screens/choose_user_type_screen.dart';
import 'package:show_up_app/widgets/indicators/dot_indicator.dart';
import 'package:show_up_app/widgets/sliders/onboarding_page_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: provider.pageController,
                    onPageChanged: provider.onPageChanged,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      OnboardingPageWidget(
                        image: "assets/icons/onboarding_1.svg",
                        title: "Discover Amazing Events",
                        subtitle:
                            "Explore events around you, meet new people, and never miss experiences that matter to you.",
                      ),
                      OnboardingPageWidget(
                        image: "assets/icons/onboarding_2.svg",
                        title: "Manage & Organize Events",
                        subtitle:
                            "Create, manage, and track your events effortlessly as an event manager.",
                      ),
                      OnboardingPageWidget(
                        image: "assets/icons/onboarding_3.svg",
                        title: "Connect Attendees & Managers",
                        subtitle:
                            "A powerful platform connecting attendees with event organizers in one place.",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      DotsIndicator(
                        currentIndex: provider.currentIndex,
                        count: 3,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          if (provider.currentIndex != 2)
                            TextButton(
                              onPressed: provider.skip,
                              child: Text(
                                "Skip",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                              ),
                            ),
                          const Spacer(),
                          Expanded(
                            child: SizedBox(
                              height: 52,
                              child: ElevatedButton(
                                onPressed: provider.currentIndex == 2
                                    ? () {
                                        Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (_) =>
                                                ChooseUserTypeScreen(),
                                          ),
                                        );
                                      }
                                    : provider.nextPage,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  elevation: 2,
                                ),
                                child: Text(
                                  provider.currentIndex == 2
                                      ? "Get Started"
                                      : "Next",
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
