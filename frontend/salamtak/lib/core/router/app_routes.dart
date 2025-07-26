import 'package:flutter/material.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/auth/views/login_screen.dart';
import 'package:salamtak/features/auth/views/signup_screen.dart';
import 'package:salamtak/features/auth/views/who_are_you_screen.dart';
import 'package:salamtak/features/doctor_details/views/doctor_details _screen.dart';
import 'package:salamtak/features/doctor_details/views/doctor_details_for_booking_screen.dart';
import 'package:salamtak/features/favorite_doctors/views/favorite_doctors_screen.dart';
import 'package:salamtak/features/find_doctors/views/find_doctor_screen.dart';
import 'package:salamtak/features/home/views/home_screen.dart';
import 'package:salamtak/features/home/views/layout_screen.dart';
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
      case "/Signup":
        return createRoute(screen: SignupScreen());
      case "/login":
        return createRoute(screen: LoginScreen());
      case "/who_are_you":
        return createRoute(screen: WhoAreYouScreen());
      case "/home":
        return createRoute(screen: HomeScreen());
      case "/find_doctor":
        return createRoute(screen: FindDoctorScreen());
      case "/favorite_doctor":
        return createRoute(screen: FavoriteDoctorsScreen());
      case "/layout":
        return createRoute(screen: LayoutScreen());
      case "/doctor_details":
        final doctor = settings.arguments as Doctors;
        return createRoute(screen: DoctorDetailsScreen(doctor: doctor));
      case "/doctor_details_for_booking":
        return createRoute(screen: DoctorDetailsForBookingScreen());

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
