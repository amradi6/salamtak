
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/profiel/cubit/profiel_state.dart';

class ProfielCubit extends Cubit<ProfielState>{
  ProfielCubit():super(ProfielInitialState());
}