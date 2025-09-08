import 'dart:io';

class ProfileState {}

final class ProfielInitialState extends ProfileState {}

class ProfileImagePicked extends ProfileState {
  final File imageFile;
  ProfileImagePicked(this.imageFile);
}

class ProfileUploading extends ProfileState {}

class ProfileUploaded extends ProfileState {
  final dynamic response;
  ProfileUploaded(this.response);
}

class ProfileUploadError extends ProfileState {
  final String error;
  ProfileUploadError(this.error);
}