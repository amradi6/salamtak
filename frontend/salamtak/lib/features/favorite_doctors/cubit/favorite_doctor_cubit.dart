import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/favorite_doctors/cubit/favorite_doctor_state.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';

class FavoriteDoctorCubit extends Cubit<FavoriteDoctorState> {
  FavoriteDoctorCubit() : super(FavoriteDoctorInitialState(dummyDoctors));

  final allDoctors = dummyDoctors;

  get favoriteDoctors=>allDoctors.where((d) => d.isFavorite??false).toList();

  void toggleFavorite(String doctorName) {
    for (var doctor in allDoctors) {
      if (doctor.name == doctorName) {
        doctor.isFavorite = !doctor.isFavorite!;
        break;
      }
    }
    emit(FavoriteDoctorInitialState(List.from(allDoctors)));
  }
}
