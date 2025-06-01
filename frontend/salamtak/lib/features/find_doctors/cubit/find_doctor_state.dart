sealed class FindDoctorState {}

final class FindDoctorInitialState extends FindDoctorState {
  final List<Map<String, dynamic>> allDoctors;

  FindDoctorInitialState(this.allDoctors);
}

final class DoctorFilterState extends FindDoctorState {
  final List<Map<String, dynamic>> filteredDoctors;

  DoctorFilterState(this.filteredDoctors);
}
