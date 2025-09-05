import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/booked_doctors/cubit/booked_doctors_cubit.dart';
import 'package:salamtak/features/doctor_details/cubit/doctor_details_cubit.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_cubit.dart';
import 'package:salamtak/features/home/cubit/home__cubit.dart';

import 'core/router/app_routes.dart';
import 'features/profiel/cubit/profiel_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => FavoriteDoctorCubit()),
        BlocProvider(create: (_) => FindDoctorCubit()),
        BlocProvider(create: (_) => DoctorDetailsCubit()),
        BlocProvider(create: (_) => ProfielCubit()),
        BlocProvider(create: (_) => BookedDoctorsCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
