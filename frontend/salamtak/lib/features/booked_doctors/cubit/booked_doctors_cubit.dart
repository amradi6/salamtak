import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/features/booked_doctors/cubit/booked_doctors_state.dart';

class BookedDoctorsCubit extends Cubit<BookedDoctorsState>{
  BookedDoctorsCubit():super(BookedDoctorsInitial());

  Future<void> getUpcomingBookings(int patientId) async{
    emit(UpcomingBookingLoading());
    try {
      final response = await http.get(
        Uri.parse("https://mohammadhussien.pythonanywhere.com/my-upcoming-bookings/$patientId/"),
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        print(data.runtimeType);
        emit(UpcomingBookingSuccess(data));
      }
      else{
        emit(UpcomingBookingError("Error Fetching Data"));
      }
    }catch(e){
      emit(UpcomingBookingError("Error : ${e.toString()}"));
    }
  }

}