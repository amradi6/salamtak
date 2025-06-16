import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';

class FavoriteDoctorCubit extends Cubit<FavoriteDoctorState> {
  FavoriteDoctorCubit() :super(FavoriteDoctorInitialState(dummyDoctors));

  final allDoctors = dummyDoctors;

  get favoriteDoctors =>
      allDoctors.where((d) => d.isFavorite ?? false).toList();

  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSearching = false;


  void toggleFavorite(String doctorName) {
    for (var doctor in allDoctors) {
      if (doctor.name == doctorName) {
        doctor.isFavorite = !doctor.isFavorite!;
        break;
      }
    }
    emit(FavoriteDoctorInitialState(List.from(favoriteDoctors)));
  }

  void filterFavoriteDoctors(String name) {
    isSearching = true;
    if (name.isEmpty) {
      emit(FavoriteDoctorInitialState(favoriteDoctors));
    } else {
      final filteredList =
      favoriteDoctors
          .where(
            (doctor) =>
            doctor.name.toString().toLowerCase().contains(
              name.toLowerCase(),
            ),
      )
          .toList();
      emit(DoctorFavoriteFilterState(filteredList));
    }
  }

  void resetFavorites() {
    isSearching = false;
    emit(FavoriteDoctorInitialState(favoriteDoctors));
  }
}
