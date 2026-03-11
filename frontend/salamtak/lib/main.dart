import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:salamtak/core/constants/supabase_config.dart';
import 'package:salamtak/core/di/injection_container.dart' as di;
import 'package:salamtak/core/di/injection_container.dart';
import 'package:salamtak/features/auth/presentation/cubit/auth_bloc.dart';

import 'package:salamtak/core/router/app_routes.dart';

import 'features/home/presentation/cubit/home_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.supabaseAnonKey,
  );

  await di.configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()),
        BlocProvider<HomeCubit>(create: (_) => sl<HomeCubit>()),
        // BlocProvider<FindDoctorCubit>(create: (_) => sl<FindDoctorCubit>()),
        // BlocProvider<FavoriteDoctorCubit>(create: (_) => sl<FavoriteDoctorCubit>()),
        // BlocProvider<DoctorDetailsCubit>(create: (_) => sl<DoctorDetailsCubit>()),
        // BlocProvider<BookedDoctorsCubit>(create: (_) => sl<BookedDoctorsCubit>()),
        // BlocProvider<ProfileCubit>(create: (_) => sl<ProfileCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
