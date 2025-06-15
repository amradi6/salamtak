import 'package:salamtak/data/models/doctors.dart';

class FavoriteDoctorState {}

final class FavoriteDoctorInitialState extends FavoriteDoctorState{
  final List<Doctors> allDoctors;
  FavoriteDoctorInitialState(this.allDoctors);
}
