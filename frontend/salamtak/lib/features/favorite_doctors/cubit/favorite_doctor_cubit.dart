import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';

class FavoriteDoctorCubit extends Cubit<FavoriteDoctorState> {
  FavoriteDoctorCubit()
    : super(
        FavoriteDoctorInitialState(
          dummyDoctors.where((d) => d.isFavorite ?? false).toList(),
        ),
      );

  get favoriteDoctors =>
      allDoctors.where((d) => d.isFavorite ?? false).toList();

  final allDoctors = dummyDoctors;

  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSearching = false;

  void toggleFavorite(int id) {
    for (var doctor in allDoctors) {
      if (doctor.id == id) {
        doctor.isFavorite = !(doctor.isFavorite ?? false);
        break;
      }
    }
    emit(FavoriteDoctorSuccess(allDoctors));
  }

  void filterFavoriteDoctors(String name) {
    isSearching = true;
    if (name.isEmpty) {
      emit(FavoriteDoctorInitialState(favoriteDoctors));
    } else {
      final filteredList =
          favoriteDoctors
              .where(
                (doctor) => doctor.name.toString().toLowerCase().contains(
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

  Future<void> clos() {
    controller.dispose();
    return super.close();
  }
}
