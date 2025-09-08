import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/features/booked_doctors/cubit/booked_doctors_state.dart';
import 'package:url_launcher/url_launcher.dart';

class BookedDoctorsCubit extends Cubit<BookedDoctorsState> {
  BookedDoctorsCubit() : super(BookedDoctorsInitial());

  Future<void> getUpcomingBookings(int patientId) async {
    emit(UpcomingBookingLoading());
    try {
      final response = await http.get(
        Uri.parse(
          "https://mohammadhussien.pythonanywhere.com/my-upcoming-bookings/$patientId/",
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(UpcomingBookingSuccess(data));
      } else {
        emit(UpcomingBookingError("Error Fetching Data"));
      }
    } catch (e) {
      emit(UpcomingBookingError("Error : ${e.toString()}"));
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  Future<void> deleteBooking(int bookId, int patientId) async {
    emit(deleteBookingLoading());
    try {
      final url = Uri.parse(
        "https://mohammadhussien.pythonanywhere.com/cancel-booking/$bookId/",
      );
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        await getUpcomingBookings(patientId);
      } else {
        emit(
          deleteBookingError(
            "Failed to cancel booking: ${response.statusCode}",
          ),
        );
      }
    } catch (e) {
      emit(deleteBookingError("Error : ${e.toString()}"));
    }
  }
}
