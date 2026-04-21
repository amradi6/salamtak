import 'package:salamtak/core/entities/doctor_entity.dart';

class FindDoctorState {}

final class FindDoctorInitialState extends FindDoctorState {}

final class DoctorFilterState extends FindDoctorState {
  final List<DoctorEntity> filteredDoctors;

  DoctorFilterState(this.filteredDoctors);
}

final class FindDoctorLoad extends FindDoctorState {}

final class FindDoctorSuccess extends FindDoctorState {
  final List<DoctorEntity> doctors;

  FindDoctorSuccess(this.doctors);
}

final class FindDoctorError extends FindDoctorState {
  final String message;

  FindDoctorError(this.message);
}
