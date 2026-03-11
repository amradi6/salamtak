import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String imageUrl;
  final String specialty;
  final double rating;
  final double price;
  final bool isFavorite;
  final int yearsOfExperience;
  final int numberOfPatients;
  final String timeNextAvailable;
  final String address;
  final int phoneNumber;
  final int consultation;
  final List<String> services;

  const DoctorEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.specialty,
    required this.rating,
    required this.price,
    this.isFavorite = false,
    required this.yearsOfExperience,
    required this.numberOfPatients,
    required this.timeNextAvailable,
    required this.address,
    required this.phoneNumber,
    required this.consultation,
    required this.services,
  });

  DoctorEntity copyWith({bool? isFavorite}) => DoctorEntity(
    id: id,
    name: name,
    email: email,
    imageUrl: imageUrl,
    specialty: specialty,
    rating: rating,
    price: price,
    isFavorite: isFavorite ?? this.isFavorite,
    yearsOfExperience: yearsOfExperience,
    numberOfPatients: numberOfPatients,
    timeNextAvailable: timeNextAvailable,
    address: address,
    phoneNumber: phoneNumber,
    consultation: consultation,
    services: services,
  );

  @override
  List<Object?> get props => [id, name, specialty, isFavorite];
}
