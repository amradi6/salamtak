import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_cubit.dart';

import 'core/router/app_routes.dart';
import 'features/home/cubit/home__cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<FindDoctorCubit>(
          create: (context) => FindDoctorCubit(),
        ),
        BlocProvider<FavoriteDoctorCubit>(
          create: (context) => FavoriteDoctorCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}