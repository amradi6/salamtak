import 'package:flutter/material.dart';
import 'package:salamtak/features/onboarding/views/onboarding_screen_01.dart';
import 'package:salamtak/features/onboarding/views/onboarding_screen_02.dart';
import 'package:salamtak/features/onboarding/views/onboarding_screen_03.dart';
import 'package:salamtak/shared/utils/create_route.dart';
import '../../features/splash/views/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case "/onboarding1":
        return createRoute(screen: OnboardingScreen01());
      case "/onboarding2":
        return createRoute(screen: OnboardingScreen02());
      case "/onboarding3":
        return createRoute(screen: OnboardingScreen03());

      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page not found')),
              ),
        );
    }
  }
}
