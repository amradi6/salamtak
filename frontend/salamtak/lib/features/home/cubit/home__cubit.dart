import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/favorite_doctors/views/favorite_doctors_screen.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';
import 'package:salamtak/features/home/views/home_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState(dummyDoctors));

  final featureDoctors =
      dummyDoctors.where((element) => element.isFeatured).toList();

  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    FavoriteDoctorsScreen(),
    Center(child: Text("Booking Screen Placeholder")),
    Center(child: Text("Chat Screen Placeholder")),
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
          final doctors = data.map((e) => Doctors.fromMap(e)).toList();
        emit(PopularDoctorsLoaded(doctors));
      } else {
        emit(PopularDoctorsError("Error Fetching Data"));
      }
    } catch (e) {
      emit(PopularDoctorsError(e.toString()));
    }
  }
}
