import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/features/doctor_details/cubit/doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit():super(DoctorDetailsInitial());

  Future<void> getAvailability(int id)async{
    emit(GetAvailabilityLoading());
    try{
      final response=await http.get(Uri.parse('https://mohammadhussien.pythonanywhere.com/getdoctor/$id/'));
      if(response.statusCode==200){
        final data=jsonDecode(response.body);
        final availability = data['availability'];
        List<String> allDays = ['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
        final availabilityMap = {
          for (var day in availability) day['week_day'] : {
            'start': day['start_time'],
            'end': day['end_time'],
          } };
        final workingHours = allDays.map((day) {
          if (availabilityMap.containsKey(day)) {
            return {
              'day': day,
              'start': availabilityMap[day]!['start'],
              'end': availabilityMap[day]!['end'],
            };
          } else {
            return {
              'day': day,
              'start': null,
              'end': null,
            };
          }
        }).toList();
        emit(GetAvailabilitySuccess(workingHours));
      }else{
        emit(GetAvailabilityError("Error Fetching Data"));
      }
    }catch(e){
      emit(GetAvailabilityError("Error : ${e.toString()}"));
    }
  }

  Future<void> getAppointmentsAvailability(int doctorId)async{
    emit(GetAppointmentsAvailabilityLoading());
    try{
      final response=await http.get(
        Uri.parse("https://mohammadhussien.pythonanywhere.com/availabilities/$doctorId/"),
      );
      if(response.statusCode==200){
        final data=jsonDecode(response.body);
        print(data);
        final availability = data;
        print(availability);
        List<dynamic> availabilityList = availability.map((item) {
          return {
            "week_day": item['week_day'],
            "available_slots": item['available_slots'],
          };
        }).toList();

        emit(GetAppointmentsAvailabilitySuccess(availabilityList));
      }
      else{
        emit(GetAppointmentsAvailabilityError("Error Fetching Data"));
      }
    }
    catch(e){
      print('Exception caught: $e');
      emit(GetAppointmentsAvailabilityError("Error: ${e.toString()}"));
    }
  }
}