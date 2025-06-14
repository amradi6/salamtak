sealed class HomeState {}

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
  final List<Map<String, dynamic>> allDoctors;

  HomeInitialState(this.allDoctors);
}

class ChangeTabState extends HomeState {}

class ChangeFavourite extends HomeState {}