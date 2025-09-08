import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_cubit.dart';
import 'package:salamtak/features/home/cubit/home__cubit.dart';
import 'package:salamtak/features/profiel/cubit/profiel_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final navigator = Navigator.of(context);
    Future.delayed(
      Duration(seconds: 2),
          () => navigator.pushReplacementNamed('/onboarding1'),
    );
    context.read<HomeCubit>().fetchPopularDoctors();
    context.read<FavoriteDoctorCubit>().fetchAllDoctors();
    context.read<FindDoctorCubit>().fetchAllDoctorsForFind(context);
    final cubit = context.read<ProfielCubit>();
    final patientId = context.read<AuthCubit>().patientId;
    Future.microtask(() async=> cubit.fetchPatient(await patientId));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: Stack(
        children: [
          CircleForBg(
            size: size,
            width: size.width * 0.5625,
            height: size.width * 0.5625,
            color: Color(0x8461CEFF),
            top: size.height * -0.1242,
            left: size.width * -0.0859,
          ),

          CircleForBg(
            size: size,
            width: size.width * 0.5625,
            height: size.width * 0.5625,
            color: Color(0x480EBE7E),
            top: size.height * 0.8057,
            left: size.width * 0.5260,
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logo.png', width: 70),
                SizedBox(height: 16),
                Text(
                  'Salamtak',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF222222),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
