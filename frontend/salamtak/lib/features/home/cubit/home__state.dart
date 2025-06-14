import 'package:salamtak/data/models/doctors.dart';

sealed class HomeState {}

final List<Doctors> dummyDoctors=[
  Doctors(name: "Dr. Fillerup Grab", image: "assets/images/doctor1.png", rating: 4.5,isPopular: true,specialty:"Medicine Specialist", isFeatured: false),
  Doctors(name: "Dr. Abduallah Wassi", image: "assets/images/Abduallah Wassi.png", rating: 4.0,isPopular: true,specialty:"In-kind",isFeatured: false),
  Doctors(name: "Dr. Osamma Saaed", image: "assets/images/Osamma Saaed.webp", rating: 0.5,isPopular: true,specialty:"Anatomy doctor",isFeatured: false),
  Doctors(name: "Dr. Amr Adi", image: "assets/images/AmrAdi.jpg", rating: 5.0,isFavorite: true,isFeatured: true,price: 100.0,isPopular: false),
  Doctors(name: "Dr. Mohaamad Razzoq", image: "assets/images/Mohaamad Razzouq.jpg", rating: 2.0,isFeatured: true,isFavorite:false,price:25.0,isPopular: false),
];

final List<Map<String, dynamic>> popDoctors = [
  {
    "image": "assets/images/doctor1.png",
    "name": "Dr. Fillerup Grab",
    "specialty": "Medicine Specialist",
    "rating": 4.5,
  },
  {
    "image": "assets/images/AmrAdi.jpg",
    "name": "Dr. Amr Adi",
    "specialty": "Internal",
    "rating": 5.0,
  },
  {
    "image": "assets/images/Abduallah Wassi.png",
    "name": "Dr. Abduallah Wassi",
    "specialty": "In-kind",
    "rating": 4.0,
  },
  {
    "image": "assets/images/Mohaamad Razzouq.jpg",
    "name": "Dr. Mohaamad Razzoq",
    "specialty": "Pharmacist",
    "rating": 2.0,
  },
  {
    "image": "assets/images/Osamma Saaed.webp",
    "name": "Dr. Osamma Saaed",
    "specialty": "Anatomy doctor",
    "rating": 0.5,
  },
  {
    "image": "assets/images/Abduallah Adi.jpg",
    "name": "Dr. Abduallah Adi",
    "specialty": "Urinary",
    "rating": 2.0,
  },
];

final List<Map<String, dynamic>> featDoctors = [
  {
    "image": "assets/images/doctor1.png",
    "name": "Dr. Fillerup Grab",
    "price": 50.0,
    "rating": 4.5,
    "favorite":false,
  },
  {
    "image": "assets/images/AmrAdi.jpg",
    "name": "Dr. Amr Adi",
    "price":100.0,
    "rating": 5.0,
    "favorite":true,
  },
  {
    "image": "assets/images/Abduallah Wassi.png",
    "name": "Dr. Abduallah Wassi",
    "price":30.0,
    "rating": 4.0,
    "favorite":true,
  },
  {
    "image": "assets/images/Mohaamad Razzouq.jpg",
    "name": "Dr. Mohaamad Razzoq",
    "price": 25.0,
    "rating": 2.0,
    "favorite":true,
  },
  {
    "image": "assets/images/Osamma Saaed.webp",
    "name": "Dr. Osamma Saaed",
    "price": 0.5,
    "rating": 0.5,
    "favorite":false,
  },
  {
    "image": "assets/images/Abduallah Adi.jpg",
    "name": "Dr. Abduallah Adi",
    "price":0.3,
    "rating": 2.0,
    "favorite":false,
  },
];

final class HomeInitialState extends HomeState {
  final List<Doctors> allDoctors;

  HomeInitialState(this.allDoctors);
}

class ChangeTabState extends HomeState {}

class ChangeFavourite extends HomeState {}