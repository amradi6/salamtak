abstract class BookedDoctorsState{}

final class BookedDoctorsInitial extends BookedDoctorsState{}

final class UpcomingBookingLoading extends BookedDoctorsState{}

final class UpcomingBookingSuccess extends BookedDoctorsState{
  final List<dynamic> bookings;
  UpcomingBookingSuccess(this.bookings);
}

final class UpcomingBookingError extends BookedDoctorsState{
  final String message;
  UpcomingBookingError(this.message);
}


final class deleteBookingLoading extends BookedDoctorsState{}

final class deleteBookingError extends BookedDoctorsState{
  final String error;
  deleteBookingError(this.error);
}