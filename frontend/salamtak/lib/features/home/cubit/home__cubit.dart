import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/views/favorite_doctors_screen.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';
import 'package:salamtak/features/home/views/home_screen.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState(doctors));

  final allDoctors=doctors;

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
}
