import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_cubit.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_state.dart';

class FindDoctorCubit extends Cubit<FindDoctorState> {

  List<Doctors> allDoctors = [];

  FindDoctorCubit() : super(FindDoctorInitialState());

  Future<void> fetchAllDoctorsForFind(BuildContext context) async {
    emit(FindDoctorLoad());
    await Future.delayed(Duration(seconds: 1));
    final favoriteCubit = context.read<FavoriteDoctorCubit>();

    if (favoriteCubit.allDoctors.isEmpty) {
      await favoriteCubit.fetchAllDoctors();
    }

    allDoctors =
        favoriteCubit.allDoctors.map((doctor) {
          doctor.isFavorite = favoriteCubit.isFavorite(doctor.id);
          return doctor;
        }).toList();

    emit(FindDoctorSuccess(allDoctors));
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
