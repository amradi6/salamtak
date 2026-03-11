part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ChangeTabState extends HomeState {}

class PopularDoctorsLoading extends HomeState {}

class PopularDoctorsSuccess extends HomeState {
  final List<DoctorEntity> popularDoctors;

  PopularDoctorsSuccess(this.popularDoctors);
}

class PopularDoctorsError extends HomeState {
  final String message;

  PopularDoctorsError(this.message);
}

class DoctorLoading extends HomeState {}

class DoctorSuccess extends HomeState {
  final List<DoctorEntity> featureDoctors;

  DoctorSuccess(this.featureDoctors);
}

class DoctorError extends HomeState {
  final String message;

  DoctorError(this.message);
}
