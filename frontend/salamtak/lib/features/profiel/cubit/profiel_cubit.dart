import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salamtak/features/profiel/cubit/profiel_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfielCubit extends Cubit<ProfielState>{
  ProfielCubit():super(ProfielInitialState());

  static const String _imageKey = "profile_image_path";

  /// تحميل الصورة من SharedPreferences
  Future<void> loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_imageKey);

    emit(LoadImageProfiel(profileImagePath: path));
  }

  /// حفظ الصورة محليًا + تخزين المسار في SharedPreferences
  Future<void> setProfileImage(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = imageFile.uri.pathSegments.last;
    final newPath = '${directory.path}/$fileName';
    final savedImage = await imageFile.copy(newPath);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, savedImage.path);

    emit(LoadImageProfiel(profileImagePath: savedImage.path));
  }

}