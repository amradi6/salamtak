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
