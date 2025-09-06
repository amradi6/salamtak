import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/profiel/cubit/profiel_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfielCubit extends Cubit<ProfielState> {
  ProfielCubit() : super(ProfielInitialState());

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("authToken");
    prefs.clear();
    Navigator.pushReplacementNamed(context, "/login");
  }
}
