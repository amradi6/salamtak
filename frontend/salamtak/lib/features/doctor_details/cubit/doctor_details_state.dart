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

class GetAppointmentsAvailabilitySuccess extends DoctorDetailsState{}

class AppointmentSelected extends DoctorDetailsState {
  final String date;
  final String time;
  final int slotId;
  AppointmentSelected({required this.date, required this.time, required this.slotId});
}

class AddBookingSuccess extends DoctorDetailsState{}

class AddBookingLoading extends DoctorDetailsState{}

class AddBookingError extends DoctorDetailsState{
  final String message;
  AddBookingError(this.message);
}