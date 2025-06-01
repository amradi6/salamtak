import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState(doctors));

  final allDoctors=doctors;

  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;
    emit(ChangeTabState());
  }
}
