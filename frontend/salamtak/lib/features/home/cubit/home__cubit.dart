import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/views/favorite_doctors_screen.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';
import 'package:salamtak/features/home/views/home_screen.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState(dummyDoctors));

  final popularDoctors=dummyDoctors.where((element) => element.isPopular).toList();

  final featureDoctors=dummyDoctors.where((element) => element.isFeatured).toList();

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

  void toggleFavorite(String doctorName) {
    for (var doctor in featureDoctors) {
      if (doctor.name  == doctorName) {
        doctor.isFavorite = ! doctor.isFavorite!;
        break;
      }
    }
    emit(ChangeFavourite());
  }

}
