import 'package:salamtak/data/models/doctors.dart';

class HomeState {}

final List<Doctors> dummyDoctors = [
  Doctors(
    id: 1,
    name: "Dr. Fillerup Grab",
    image: "assets/images/doctor1.png",
    rating: 4.5,
    isPopular: true,
    specialty: "Medicine Specialist",
    isFeatured: false,
    numberOfPatients: 50,
    numberOfYearsOfExperience: 3,
    timeNextAvailable: "10:00 AM",
    price: 50.00,
  ),
  Doctors(
    id: 2,
    name: "Dr. Abduallah Wassi",
    image: "assets/images/Abduallah Wassi.png",
    rating: 4.0,
    isPopular: true,
    specialty: "In-kind",
    isFeatured: false,
    numberOfPatients: 50,
    numberOfYearsOfExperience: 3,
    timeNextAvailable: "10:00 AM",
    price: 10.00,
  ),
  Doctors(
    id: 3,
    name: "Dr. Osamma Saaed",
    image: "assets/images/Osamma Saaed.webp",
    rating: 0.5,
    isPopular: true,
    specialty: "Anatomy doctor",
    isFeatured: false,
    numberOfPatients: 50,
    numberOfYearsOfExperience: 3,
    timeNextAvailable: "10:00 AM",
    price: 0.5,
  ),
  Doctors(
    id: 4,
    name: "Dr. Amr Adi",
    image: "assets/images/AmrAdi.jpg",
    rating: 5.0,
    isFavorite: true,
    isFeatured: true,
    price: 100.0,
    isPopular: false,
    numberOfPatients: 50,
    numberOfYearsOfExperience: 3,
    specialty: "amklmlsa",
    timeNextAvailable: "10:00 AM",
  ),
  Doctors(
    id: 5,
    name: "Dr. Mohaamad Razzoq",
    image: "assets/images/Mohaamad Razzouq.jpg",
    rating: 2.0,
    isFeatured: true,
    isFavorite: false,
    price: 25.0,
    isPopular: false,
    numberOfPatients: 50,
    numberOfYearsOfExperience: 3,
    specialty: "amklmlsa",
    timeNextAvailable: "10:00 AM",
  ),
];

final class HomeInitialState extends HomeState {
  final List<Doctors> allDoctors;

  HomeInitialState(this.allDoctors);
}

class ChangeTabState extends HomeState {}

class PopularDoctorsInitial extends HomeState {}

class PopularDoctorsLoading extends HomeState {}

class PopularDoctorsLoaded extends HomeState {
  final List<Doctors> doctors;

  PopularDoctorsLoaded(this.doctors);
}

class PopularDoctorsError extends HomeState {
  final String message;

  PopularDoctorsError(this.message);
}