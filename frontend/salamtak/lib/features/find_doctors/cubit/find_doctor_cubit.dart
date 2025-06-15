import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/data/models/doctors.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_state.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';

class FindDoctorCubit extends Cubit<FindDoctorState> {
  List<Doctors> allDoctors = dummyDoctors;

  FindDoctorCubit() : super(FindDoctorInitialState(dummyDoctors));

  void filterDoctors(String name) {
    if (name.isEmpty) {
      emit(FindDoctorInitialState(allDoctors));
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
    emit(FindDoctorInitialState(dummyDoctors));
  }

  void toggleFavorite(String doctorName) {
    for (var doctor in allDoctors) {
      if (doctor.name == doctorName) {
        doctor.isFavorite = !doctor.isFavorite!;
        break;
      }
    }
    if (state is DoctorFilterState) {
      final currentFilter = (state as DoctorFilterState).filteredDoctors;
      final updatedFilter = allDoctors
          .where((doctor) =>
          currentFilter.any((filteredDoc) => filteredDoc.name == doctor.name))
          .toList();

      emit(DoctorFilterState(List.from(updatedFilter)));
    } else {
      emit(FindDoctorInitialState(List.from(allDoctors)));
    }
  }
}
