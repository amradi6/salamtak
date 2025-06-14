import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/find_doctors/cubit/find_doctor_state.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';

class FindDoctorCubit extends Cubit<FindDoctorState> {
  FindDoctorCubit() : super(FindDoctorInitialState(popDoctors));

  void filterDoctors(String name) {
    if (name.isEmpty) {
      emit(FindDoctorInitialState(popDoctors));
    } else {
      final filteredList =
          popDoctors
              .where(
                (doctor) => doctor["name"].toString().toLowerCase().contains(
                  name.toLowerCase(),
                ),
              )
              .toList();
      emit(DoctorFilterState(filteredList));
    }
  }

  void resetDoctors() {
    emit(FindDoctorInitialState(popDoctors));
  }

}
