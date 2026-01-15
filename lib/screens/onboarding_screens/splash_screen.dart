import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/models/enums/auth_status.dart';
import 'package:show_up_app/providers/auth_provider.dart';
import 'package:show_up_app/screens/auth_screens/choose_user_type_screen.dart';
import 'package:show_up_app/screens/onboarding_screens/onboarding_screens.dart';
import 'package:show_up_app/screens/place_holder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfterDelay();
  }

  void navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final auth = context.read<AuthProvider>();

    auth.checkAuthStatus();

    if (!mounted) return;

    Widget nextScreen;

    switch (auth.status) {
      case AuthStatus.firstOpen:
        nextScreen = const OnboardingScreen();
        break;
      case AuthStatus.unauthenticated:
        nextScreen = const ChooseUserTypeScreen();
        break;
      case AuthStatus.authenticatedUser:
      case AuthStatus.authenticatedManager:
        nextScreen = const HomePlaceholderScreen();
        break;
    }

    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => nextScreen,
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 150, height: 150)
                .animate()
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: 1500.ms,
                )
                .fade(duration: 1500.ms),
            const SizedBox(height: 20),
            Text(
                  'Faliya App',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                )
                .animate()
                .slide(
                  begin: const Offset(0, 1),
                  end: const Offset(0, 0),
                  duration: 1200.ms,
                )
                .fade(duration: 1200.ms),
          ],
        ),
      ),
    );
  }
}
