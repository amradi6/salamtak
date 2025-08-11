import 'package:salamtak/data/models/doctors.dart';

class FavoriteDoctorState {}

final class FavoriteDoctorInitialState extends FavoriteDoctorState {}

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

final class SyncFavoritesToServerLoading extends FavoriteDoctorState{}

final class SyncFavoritesToServerSuccess extends FavoriteDoctorState{}

final class SyncFavoritesToServerError extends FavoriteDoctorState{
  final String message;
  SyncFavoritesToServerError(this.message);
}