class ProfielState {}

final class ProfielInitialState extends ProfielState {}

final class LoadImageProfiel extends ProfielState{
  final String? profileImagePath;

  LoadImageProfiel({this.profileImagePath});

  LoadImageProfiel copyWith({String? profileImagePath}) {
    return LoadImageProfiel(
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }
}