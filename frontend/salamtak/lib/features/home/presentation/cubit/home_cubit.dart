import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/entities/doctor_entity.dart';
import 'package:salamtak/features/home/domain/usecases/home_usecases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPopularDoctorsUseCase    _getPopular;
  final GetDoctorsBySpecialtyUseCase _getBySpecialty;

  HomeCubit({
    required GetPopularDoctorsUseCase    getPopularDoctors,
    required GetDoctorsBySpecialtyUseCase getDoctorsBySpecialty,
  })  : _getPopular      = getPopularDoctors,
        _getBySpecialty  = getDoctorsBySpecialty,
        super(HomeInitial());

  int currentIndex = 0;

  late final List<Widget> screens;


  List<DoctorEntity> cachedPopularDoctors = [];

  void changeTab(int index) {
    currentIndex = index;
    emit(ChangeTabState());
  }

  Future<void> fetchPopularDoctors() async {
    emit(PopularDoctorsLoading());
    final result = await _getPopular();
    result.fold(
          (f) => emit(PopularDoctorsError(f.message)),
          (d) {
        cachedPopularDoctors = d;
        emit(PopularDoctorsSuccess(d));
      },
    );
  }

  Future<void> getDoctorsBySpeciality(String specialty) async {
    emit(DoctorLoading());
    final result = await _getBySpecialty(specialty);
    result.fold(
          (f) => emit(DoctorError(f.message)),
          (d) => emit(DoctorSuccess(d)),
    );
  }
}