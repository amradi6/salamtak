import 'package:salamtak/data/models/doctors.dart';

class HomeState {}

final class HomeInitialState extends HomeState {}

class ChangeTabState extends HomeState {}

class PopularDoctorsLoading extends HomeState {}

class PopularDoctorsSuccess extends HomeState {
  final List<Doctors> popularDoctors;

  PopularDoctorsSuccess(this.popularDoctors);
}

class PopularDoctorsError extends HomeState {
  final String message;

  PopularDoctorsError(this.message);
}

class DoctorLoading extends HomeState {}

class DoctorSuccess extends HomeState {
  final List<Doctors> featureDoctors;

  DoctorSuccess(this.featureDoctors);
}

class DoctorError extends HomeState {
  final String message;

  DoctorError(this.message);
}
