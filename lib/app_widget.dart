import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/providers/attendence_provider.dart';
import 'package:show_up_app/providers/auth_provider.dart';
import 'package:show_up_app/providers/base_provider.dart';
import 'package:show_up_app/providers/bottom_nav_provider.dart';
import 'package:show_up_app/providers/discover_provider.dart';
import 'package:show_up_app/providers/event_owner_provider.dart';
import 'package:show_up_app/providers/onboarding_provider.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';
import 'package:show_up_app/providers/theme_provider.dart';
import 'package:show_up_app/providers/user_type_provider.dart';
import 'package:show_up_app/screens/onboarding_screens/splash_screen.dart';
import 'package:show_up_app/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (_, __) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => SharedPrefsProvider()..initPrefs(),
            ),
            ChangeNotifierProvider(create: (_) => BaseProvider()),
            ChangeNotifierProxyProvider<SharedPrefsProvider, ThemeProvider>(
              create: (context) => ThemeProvider(
                sharedPrefs: context.read<SharedPrefsProvider>(),
              ),
              update: (_, sharedPrefs, themeProvider) =>
                  themeProvider!..sharedPrefs,
            ),
            ChangeNotifierProxyProvider<SharedPrefsProvider, AuthProvider>(
              create: (context) => AuthProvider(
                sharedPrefs: context.read<SharedPrefsProvider>(),
              ),
              update: (_, sharedPrefs, authProvider) =>
                  authProvider!..checkAuthStatus(),
            ),
            ChangeNotifierProvider(create: (_) => DiscoverProvider()),
            ChangeNotifierProvider(create: (_) => EventOwnerProvider()),
            ChangeNotifierProvider(create: (_) => AttendanceProvider()),
            ChangeNotifierProvider(create: (_) => OnboardingProvider()),
            ChangeNotifierProvider(create: (_) => SelectAccountTypeProvider()),
             ChangeNotifierProvider(create: (_) => BottomNavProvider()),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Faliya',
                theme: AppTheme.instance.lightTheme,
                darkTheme: AppTheme.instance.darkTheme,
                themeMode: themeProvider.isDarkMode
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: const SplashScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
