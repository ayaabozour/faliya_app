import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/providers/attendence_provider.dart';
import 'package:show_up_app/providers/profile_provider.dart';
import 'services/network/dio_factory.dart';
import 'services/network/api_client.dart';
import 'services/network/api_service.dart';
import 'providers/shared_prefs_provider.dart';
import 'providers/base_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/onboarding_provider.dart';
import 'providers/my_events_provider.dart';
import 'providers/discover_provider.dart';
import 'providers/event_owner_provider.dart';
import 'providers/bottom_nav_provider.dart';
import 'providers/user_type_provider.dart';
import 'screens/onboarding_screens/splash_screen.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return MultiProvider(
          providers: [
            Provider(create: (_) => ApiClient(DioFactory.create())),
            Provider(
              create: (context) => ApiService(context.read<ApiClient>()),
            ),
            ChangeNotifierProvider.value(value: SharedPrefsProvider.instance),

            ChangeNotifierProxyProvider<ApiService, BaseProvider>(
              create: (context) => BaseProvider(context.read<ApiService>()),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<SharedPrefsProvider, ThemeProvider>(
              create: (context) => ThemeProvider(SharedPrefsProvider.instance),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<SharedPrefsProvider, AuthProvider>(
              create: (context) => AuthProvider(context.read<ApiService>()),
              update: (_, __, provider) {
                provider!.checkAuthStatus();
                return provider;
              },
            ),

            ChangeNotifierProxyProvider<ApiService, OnboardingProvider>(
              create: (context) =>
                  OnboardingProvider(context.read<ApiService>()),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<ApiService, SelectAccountTypeProvider>(
              create: (context) =>
                  SelectAccountTypeProvider(context.read<ApiService>()),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<ApiService, MyEventsProvider>(
              create: (context) =>
                  MyEventsProvider(context.read<ApiService>())..loadEvents(),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<ApiService, DiscoverProvider>(
              create: (context) => DiscoverProvider(context.read<ApiService>()),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<ApiService, EventOwnerProvider>(
              create: (context) =>
                  EventOwnerProvider(context.read<ApiService>()),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<ApiService, AttendanceProvider>(
              create: (context) =>
                  AttendanceProvider(context.read<ApiService>()),
              update: (_, __, provider) => provider!,
            ),

            ChangeNotifierProxyProvider<ApiService, BottomNavProvider>(
              create: (context) =>
                  BottomNavProvider(context.read<ApiService>()),
              update: (_, __, provider) => provider!,
            ),
            ChangeNotifierProxyProvider<ApiService, ProfileProvider>(
              create: (context) => ProfileProvider(context.read<ApiService>()),
              update: (_, __, provider) {
                provider!.loadOwnerProfile();
                return provider;
              },
            ),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, theme, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.instance.lightTheme,
                darkTheme: AppTheme.instance.darkTheme,
                themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                home: const SplashScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
