import 'package:salamtak/data/models/doctors.dart';

class FindDoctorState {}

final class FindDoctorInitialState extends FindDoctorState {}

final class DoctorFilterState extends FindDoctorState {
  final List<Doctors> filteredDoctors;

  DoctorFilterState(this.filteredDoctors);
}

final class FindDoctorLoad extends FindDoctorState{}

final class FindDoctorSuccess extends FindDoctorState{
  final List<Doctors> doctors;
  FindDoctorSuccess(this.doctors);
}

final class FindDoctorError extends FindDoctorState{
  final String message;
  FindDoctorError(this.message);
}
