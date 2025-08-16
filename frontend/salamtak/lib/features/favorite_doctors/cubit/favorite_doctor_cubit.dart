import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';

class FavoriteDoctorCubit extends Cubit<FavoriteDoctorState> {
  FavoriteDoctorCubit() : super(FavoriteDoctorInitialState());

  final List<Doctors> allDoctors = [];

  get favoriteDoctors =>
      allDoctors.where((d) => d.isFavorite ?? false).toList();

  final Set<int> favoriteIds = {};

  final Set<int> _pendingChanges = {};

  bool isFavorite(int id) => favoriteIds.contains(id);

  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSearching = false;

  Future<void> syncFavoritesToServer() async {
    emit(SyncFavoritesToServerLoading());
    if (_pendingChanges.isEmpty) return;

    try {
      final response = await http.post(
        Uri.parse("https://mohammadhussien.pythonanywhere.com/changefavorite/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"ids": _pendingChanges.toList()}),
      );

      if (response.statusCode == 200) {
        _pendingChanges.clear();
        emit(SyncFavoritesToServerSuccess());
      } else {
       emit(SyncFavoritesToServerError("Error:${response.statusCode}"));
      }
    } catch (e) {
      emit(SyncFavoritesToServerError("in catch block ${e.toString()}"));
    }
  }

  Future<void> fetchAllDoctors() async {
    emit(FavoriteDoctorLoading());
    try {
      final response = await http.get(
        Uri.parse("https://mohammadhussien.pythonanywhere.com/getdoctors/"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        allDoctors.clear();
        favoriteIds.clear();

        for (var item in data) {
          final doctor = Doctors.fromMap(item);
          allDoctors.add(doctor);

          if (doctor.isFavorite!) {
            favoriteIds.add(doctor.id);
          }
        }
        emit(FavoriteDoctorSuccess(allDoctors));
      }
      else {
        emit(FavoriteDoctorError("Failed to load doctors."));
      }
    } catch (e) {
      emit(
        FavoriteDoctorError(
          "An error occurred while connecting to the server.",
        ),
      );
    }
  }

  void toggleFavorite(Doctors doctor) {
    if (favoriteIds.contains(doctor.id)) {
      favoriteIds.remove(doctor.id);
      doctor.isFavorite = false;
    } else {
      favoriteIds.add(doctor.id);
      doctor.isFavorite = true;
    }

    _pendingChanges.add(doctor.id);
    emit(FavoriteDoctorSuccess(allDoctors));
  }

  void filterFavoriteDoctors(String name) {
    isSearching = true;
    if (name.isEmpty) {
      emit(FavoriteDoctorInitialState());
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
    emit(FavoriteDoctorInitialState());
  }

  Future<void> clos() {
    controller.dispose();
    return super.close();
  }
}
