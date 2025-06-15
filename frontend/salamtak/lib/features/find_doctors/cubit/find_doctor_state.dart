import 'package:salamtak/data/models/doctors.dart';

class FindDoctorState {}

final class FindDoctorInitialState extends FindDoctorState {
  final List<Doctors> allDoctors;

  FindDoctorInitialState(this.allDoctors);
}

final class DoctorFilterState extends FindDoctorState {
  final List<Doctors> filteredDoctors;

  DoctorFilterState(this.filteredDoctors);
}
