import 'package:salamtak/data/models/doctors.dart';

class FavoriteDoctorState {}

final class FavoriteDoctorInitialState extends FavoriteDoctorState {
  final List<Doctors> favoriteDoctors;

  FavoriteDoctorInitialState(this.favoriteDoctors);
}

final class DoctorFavoriteFilterState extends FavoriteDoctorState {
  final List<Doctors> filteredDoctors;

  DoctorFavoriteFilterState(this.filteredDoctors);
}

final class FavoriteDoctorLoading extends FavoriteDoctorState{}

final class FavoriteDoctorSuccess extends FavoriteDoctorState{
  List<Doctors> allDoctors = [];
  FavoriteDoctorSuccess(this.allDoctors);
}

final class FavoriteDoctorError extends FavoriteDoctorState{
  final String message;
  FavoriteDoctorError(this.message);
}
