import 'package:flutter/material.dart';
import 'package:salamtak/features/auth/presentation/screen/login_screen.dart';
import 'package:salamtak/features/auth/presentation/screen/signup_screen.dart';
import 'package:salamtak/features/auth/presentation/screen/who_are_you_screen.dart';
import 'package:salamtak/features/home/presentation/screen/home_screen.dart';
import 'package:salamtak/features/home/presentation/screen/layout_screen.dart';
import 'package:salamtak/features/onboarding/views/onboarding_screen_01.dart';
import 'package:salamtak/features/onboarding/views/onboarding_screen_02.dart';
import 'package:salamtak/features/onboarding/views/onboarding_screen_03.dart';
import 'package:salamtak/features/splash/presentation/views/splash_screen.dart';
import 'package:salamtak/shared/utils/create_route.dart';

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
      case "/Signup":
        return createRoute(screen: SignupScreen());
      case "/login":
        return createRoute(screen: LoginScreen());
      case "/who_are_you":
        return createRoute(screen: WhoAreYouScreen());
      case "/home":
        return createRoute(screen: HomeScreen());
      // case "/find_doctor":
      //   return createRoute(screen: FindDoctorScreen());
      // case "/favorite_doctor":
      //   return createRoute(screen: FavoriteDoctorsScreen());
      case "/layout":
        return createRoute(screen: LayoutScreen());
      // case "/doctor_details":
      //   final doctor = settings.arguments as Doctors;
      //   return createRoute(screen: DoctorDetailsScreen(doctor: doctor));
      // case "/doctor_details_for_booking":
      //   final doctor = settings.arguments as Doctors;
      //   return createRoute(
      //     screen: DoctorDetailsForBookingScreen(doctor: doctor),
      //   );
      // case "/booked_doctors":
      //   return createRoute(screen: BookedDoctorsScreen());
      // case "/profiel":
      //   return createRoute(screen: ProfielScreen());
      // case "/medical_questionnaire_screen":
      //   return createRoute(screen: MedicalQuestionnaireScreen());
      // case "/popular_screen":
      //   return createRoute(screen: PopularScreen());
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
