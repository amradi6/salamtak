abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState{}

class GetAvailabilityLoading extends DoctorDetailsState{}

class GetAvailabilityError extends DoctorDetailsState{
  final String message;
  GetAvailabilityError(this.message);
}

class GetAvailabilitySuccess extends DoctorDetailsState{
  final List<dynamic> workingHours;
  GetAvailabilitySuccess( this.workingHours);
}

class GetAppointmentsAvailabilityLoading extends DoctorDetailsState{}

class GetAppointmentsAvailabilityError extends DoctorDetailsState{
  final String message;
  GetAppointmentsAvailabilityError(this.message);
}

class GetAppointmentsAvailabilitySuccess extends DoctorDetailsState{
  final List<dynamic> availability;
  GetAppointmentsAvailabilitySuccess( this.availability);
}