// lib/core/di/injection_container.dart

import 'package:get_it/get_it.dart';
import 'package:salamtak/features/splash/data/datasources/splash_local_datasource.dart';
import 'package:salamtak/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:salamtak/features/splash/domain/repositories/splash_repository.dart';
import 'package:salamtak/features/splash/domain/usecases/get_initial_route_usecase.dart';
import 'package:salamtak/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ── splash ────────────────────────────────────────────────────────────────────


// ── auth ──────────────────────────────────────────────────────────────────────
import 'package:salamtak/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:salamtak/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:salamtak/features/auth/domain/repositories/auth_repository.dart';
import 'package:salamtak/features/auth/domain/usecases/login_usecase.dart';
import 'package:salamtak/features/auth/domain/usecases/logout_usecase.dart';
import 'package:salamtak/features/auth/domain/usecases/signup_usecase.dart';
import 'package:salamtak/features/auth/presentation/cubit/auth_bloc.dart';


// ── home ──────────────────────────────────────────────────────────────────────
import 'package:salamtak/features/home/data/datasources/home_remote_datasource.dart';
import 'package:salamtak/features/home/data/repositories/home_repository_impl.dart';
import 'package:salamtak/features/home/domain/repositories/home_repository.dart';
import 'package:salamtak/features/home/domain/usecases/home_usecases.dart';
import 'package:salamtak/features/home/presentation/cubit/home_cubit.dart';

// ── find_doctors ──────────────────────────────────────────────────────────────
// import 'package:salamtak/features/find_doctors/data/datasources/find_doctor_remote_datasource.dart';
// import 'package:salamtak/features/find_doctors/data/repositories/find_doctor_repository_impl.dart';
// import 'package:salamtak/features/find_doctors/domain/repositories/find_doctor_repository.dart';
// import 'package:salamtak/features/find_doctors/domain/usecases/get_all_doctors_usecase.dart';
// import 'package:salamtak/features/find_doctors/presentation/cubit/find_doctor_cubit.dart';

// ── favorite_doctors ──────────────────────────────────────────────────────────
// import 'package:salamtak/features/favorite_doctors/data/datasources/favorite_doctor_remote_datasource.dart';
// import 'package:salamtak/features/favorite_doctors/data/repositories/favorite_doctor_repository_impl.dart';
// import 'package:salamtak/features/favorite_doctors/domain/repositories/favorite_doctor_repository.dart';
// import 'package:salamtak/features/favorite_doctors/domain/usecases/favorite_doctor_usecases.dart';
// import 'package:salamtak/features/favorite_doctors/presentation/cubit/favorite_doctor_cubit.dart';

// ── doctor_details ────────────────────────────────────────────────────────────
// import 'package:salamtak/features/doctor_details/data/datasources/doctor_details_remote_datasource.dart';
// import 'package:salamtak/features/doctor_details/data/repositories/doctor_details_repository_impl.dart';
// import 'package:salamtak/features/doctor_details/domain/repositories/doctor_details_repository.dart';
// import 'package:salamtak/features/doctor_details/domain/usecases/doctor_details_usecases.dart';
// import 'package:salamtak/features/doctor_details/presentation/cubit/doctor_details_cubit.dart';

// ── booked_doctors ────────────────────────────────────────────────────────────
// import 'package:salamtak/features/booked_doctors/data/datasources/booked_doctors_remote_datasource.dart';
// import 'package:salamtak/features/booked_doctors/data/repositories/booked_doctors_repository_impl.dart';
// import 'package:salamtak/features/booked_doctors/domain/repositories/booked_doctors_repository.dart';
// import 'package:salamtak/features/booked_doctors/domain/usecases/booked_doctors_usecases.dart';
// import 'package:salamtak/features/booked_doctors/presentation/cubit/booked_doctors_cubit.dart';

// ── profile ───────────────────────────────────────────────────────────────────
// import 'package:salamtak/features/profile/data/datasources/profile_remote_datasource.dart';
// import 'package:salamtak/features/profile/data/repositories/profile_repository_impl.dart';
// import 'package:salamtak/features/profile/domain/repositories/profile_repository.dart';
// import 'package:salamtak/features/profile/domain/usecases/profile_usecases.dart';
// import 'package:salamtak/features/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  final client = Supabase.instance.client;
  sl.registerLazySingleton<SupabaseClient>(() => client);

  // ════════════════════════════════════════════════════════════════════════
  // SPLASH
  // ════════════════════════════════════════════════════════════════════════
  sl.registerLazySingleton<SplashLocalDatasource>(() => SplashLocalDatasourceImpl(sl()));
  sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetInitialRouteUsecase(sl()));
  sl.registerFactory(() => SplashCubit(getInitialRoute: sl()));

  // ════════════════════════════════════════════════════════════════════════
  // AUTH
  // ════════════════════════════════════════════════════════════════════════
  sl.registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerFactory(
        () => AuthCubit(
      loginUseCase: sl(),
      signupUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );

  // ════════════════════════════════════════════════════════════════════════
  // HOME
  // ════════════════════════════════════════════════════════════════════════
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetPopularDoctorsUseCase(sl()));
  sl.registerLazySingleton(() => GetDoctorsBySpecialtyUseCase(sl()));
  sl.registerFactory(() => HomeCubit(getPopularDoctors: sl(), getDoctorsBySpecialty: sl()));

  // ════════════════════════════════════════════════════════════════════════
  // FIND DOCTORS
  // ════════════════════════════════════════════════════════════════════════
  // sl.registerLazySingleton<FindDoctorRemoteDataSource>(() => FindDoctorRemoteDataSourceImpl(sl()));
  // sl.registerLazySingleton<FindDoctorRepository>(() => FindDoctorRepositoryImpl(sl()));
  // sl.registerLazySingleton(() => GetAllDoctorsUseCase(sl()));
  // sl.registerFactory(() => FindDoctorCubit(getAllDoctors: sl()));

  // ════════════════════════════════════════════════════════════════════════
  // FAVORITE DOCTORS
  // ════════════════════════════════════════════════════════════════════════
  // sl.registerLazySingleton<FavoriteDoctorRemoteDataSource>(() => FavoriteDoctorRemoteDataSourceImpl(sl()));
  // sl.registerLazySingleton<FavoriteDoctorRepository>(() => FavoriteDoctorRepositoryImpl(sl()));
  // sl.registerLazySingleton(() => GetAllDoctorsWithFavoritesUseCase(sl()));
  // sl.registerLazySingleton(() => ToggleFavoriteUseCase(sl()));
  // sl.registerFactory(() => FavoriteDoctorCubit(getAllDoctors: sl(), toggleFavorite: sl()));

  // ════════════════════════════════════════════════════════════════════════
  // DOCTOR DETAILS
  // ════════════════════════════════════════════════════════════════════════
  // sl.registerLazySingleton<DoctorDetailsRemoteDataSource>(() => DoctorDetailsRemoteDataSourceImpl(sl()));
  // sl.registerLazySingleton<DoctorDetailsRepository>(() => DoctorDetailsRepositoryImpl(sl()));
  // sl.registerLazySingleton(() => GetAvailabilityUseCase(sl()));
  // sl.registerLazySingleton(() => AddBookingUseCase(sl()));
  // sl.registerFactory(() => DoctorDetailsCubit(getAvailability: sl(), addBooking: sl()));

  // ════════════════════════════════════════════════════════════════════════
  // BOOKED DOCTORS
  // ════════════════════════════════════════════════════════════════════════
  // sl.registerLazySingleton<BookedDoctorsRemoteDataSource>(() => BookedDoctorsRemoteDataSourceImpl(sl()));
  // sl.registerLazySingleton<BookedDoctorsRepository>(() => BookedDoctorsRepositoryImpl(sl()));
  // sl.registerLazySingleton(() => GetUpcomingBookingsUseCase(sl()));
  // sl.registerLazySingleton(() => CancelBookingUseCase(sl()));
  // sl.registerFactory(() => BookedDoctorsCubit(getBookings: sl(), cancelBooking: sl()));

  // ════════════════════════════════════════════════════════════════════════
  // PROFILE
  // ════════════════════════════════════════════════════════════════════════
  // sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(sl()));
  // sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl()));
  // sl.registerLazySingleton(() => GetPatientUseCase(sl()));
  // sl.registerLazySingleton(() => UpdatePatientPhotoUseCase(sl()));
  // sl.registerFactory(() => ProfileCubit(getPatient: sl(), updatePhoto: sl()));
}