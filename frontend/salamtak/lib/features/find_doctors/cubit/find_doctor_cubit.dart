import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_state.dart';

class FindDoctorCubit extends Cubit<FindDoctorState> {
  List<Doctors> allDoctors = [];

  FindDoctorCubit() : super(FindDoctorInitialState());

  Future<void> fetchAllDoctors() async {
    emit(FindDoctorLoad());
    try{
      final response = await http.get(Uri.parse('https://mohammadhussien.pythonanywhere.com/getdoctors/'));
      if(response.statusCode == 200){
        final List<dynamic> data = json.decode(response.body);
        allDoctors = data.map((e) => Doctors.fromMap(e)).toList();
        emit(FindDoctorSuccess(allDoctors));
    }
      else {
        emit(FindDoctorError("Failed to connect to server"));
      }
    }
    catch(e){
      emit(FindDoctorError(e.toString()));
    }
  }

  void filterDoctors(String name) {
    if (name.isEmpty) {
      emit(FindDoctorSuccess(allDoctors));
    } else {
      final filteredList =
          allDoctors
              .where(
                (doctor) => doctor.name.toString().toLowerCase().contains(
                  name.toLowerCase(),
                ),
              )
              .toList();
      emit(DoctorFilterState(filteredList));
    }
  }

  void resetDoctors() {
    emit(FindDoctorSuccess(allDoctors));
  }
}
