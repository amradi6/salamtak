import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salamtak/features/profiel/cubit/profiel_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class ProfielCubit extends Cubit<ProfileState> {
  ProfielCubit() : super(ProfielInitialState());

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  File? get imageFile => _imageFile;

  String email="";

  String? name="";

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("authToken");
    prefs.clear();
    Navigator.pushReplacementNamed(context, "/login");
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Edit Image',
              toolbarColor: Colors.green,
              toolbarWidgetColor: Colors.white,
              hideBottomControls: true,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: false,
            ),
          ],
        );

        if (croppedFile != null) {
          _imageFile = File(croppedFile.path);
          emit(ProfileImagePicked(_imageFile!));
        }
    }catch(e){
      print('Error picking or cropping image: $e');
    }
  }

  Future<void> uploadImage(int patientId) async {
    if (_imageFile == null) return;
    emit(ProfileUploading());

    try {
      final uri = Uri.parse(
        'https://mohammadhussien.pythonanywhere.com/patientupdate/$patientId/',
      );

      final mimeType = lookupMimeType(_imageFile!.path) ?? "";
      final request = http.MultipartRequest('PATCH', uri);
      request.files.add(
        await http.MultipartFile.fromPath(
          'photo',
          _imageFile!.path,
          contentType: MediaType.parse(mimeType),
          filename: path.basename(_imageFile!.path),
        ),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        emit(ProfileUploaded(response.body));
      } else {
        emit(
          ProfileUploadError(
            'An error occurred while uploading the image: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(ProfileUploadError(e.toString()));
    }
  }

  Future<void> fetchPatient(int patientId) async {
    emit(FetchPatientLoad());
    try {
      final uri = Uri.parse(
        'https://mohammadhussien.pythonanywhere.com/getpatient/$patientId/',
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final photoUrl = data['photo'];
        final user =data['user'];
        email=user['email'];
        name=user['username'];
        emit(FetchPatientSuccess(photoUrl: photoUrl,email: email));
      } else {
        emit(ProfileUploadError(
            'Error fetching patient: ${response.statusCode}'));
      }
    } catch (e) {
      emit(FetchPatientError(e.toString()));
    }
  }
}
