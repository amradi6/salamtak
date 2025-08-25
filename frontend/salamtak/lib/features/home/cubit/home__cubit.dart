import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/booked_doctors/views/booked_doctors_screen.dart';
import 'package:salamtak/features/favorite_doctors/views/favorite_doctors_screen.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';
import 'package:salamtak/features/home/views/home_screen.dart';
import 'package:salamtak/features/profiel/views/profiel_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Doctors> popularDoctors = [];

  List<Doctors> featureDoctors = [];

  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    FavoriteDoctorsScreen(),
    BookedDoctorsScreen(),
    ProfielScreen(),
  ];

  void changeTab(int index) {
    currentIndex = index;
    emit(ChangeTabState());
  }

  Future<void> fetchPopularDoctors() async {
    emit(PopularDoctorsLoading());
    try {
      final response = await http.get(Uri.parse('https://mohammadhussien.pythonanywhere.com/getpopulardoctors/'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
           popularDoctors = data.map((e) => Doctors.fromMap(e)).toList();
        emit(PopularDoctorsSuccess(popularDoctors));
      } else {
        emit(PopularDoctorsError("Error Fetching Data"));
      }
    } catch (e) {
      emit(PopularDoctorsError(e.toString()));
    }
  }

  Future<void> getDoctorsBySpeciality(String speciality) async {
    emit(DoctorLoading());

    final url = Uri.parse(
        'https://mohammadhussien.pythonanywhere.com/getsepcialitydoctors/$speciality/',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
         featureDoctors = data.map((e) => Doctors.fromMap(e)).toList();
        emit(DoctorSuccess(featureDoctors));
      } else {
        emit(DoctorError("Failed to fetch data: ${response.statusCode}"));
      }
    } catch (e) {
      emit(DoctorError("An error occurred while connecting to the server."));
    }
  }
}
