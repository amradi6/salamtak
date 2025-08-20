class Doctors {
  final int id;
  final String name;
  final String image;
  final String specialty;
  final double rating;
  final double price;
  bool? isFavorite;
  final int? consultation;
  final int? phoneNumber;
  final int numberOfYearsOfExperience;
  final int numberOfPatients;
  final String timeNextAvailable;
  final String? address;
  final List<String>? services;
  final String? email;

  Doctors({
    this.email,
    this.services,
    this.address,
    this.phoneNumber,
    this.consultation,
    required this.id,
    required this.name,
    required this.image,
    required this.specialty,
    required this.rating,
    required this.price,
    this.isFavorite = false,
    required this.numberOfYearsOfExperience,
    required this.numberOfPatients,
    required this.timeNextAvailable,
  });

  factory Doctors.fromMap(Map<String, dynamic> map) {
    final user = map['user'] ?? {};
    return Doctors(
      id: map['id'],
      email: user['email']??"",
      image: map['photo'] ?? "assets/images/doctor.png",
      name: user['username'] ?? "User Name",
      specialty: map['sepciality'] ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      isFavorite: map['isFavorite'],
      numberOfYearsOfExperience: map['numberOfYearsOfExperience'] ?? 0,
      numberOfPatients: map['numberOfPatients'] ?? 0,
      timeNextAvailable: map['timeNextAvailable'] ?? '',
      consultation: map['consultation'] ?? 0,
      phoneNumber: map['phoneNumber'] ?? 0,
      address: map['address'] ?? "",
      services: (map['services'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'specialty': specialty,
      'rating': rating,
      'price': price,
      'favorite': isFavorite,
      'numberOfYearsOfExperience': numberOfYearsOfExperience,
      'numberOfPatients': numberOfPatients,
      'timeNextAvailable': timeNextAvailable,
      'services': services,
      'address': address,
      'phoneNumber': phoneNumber,
      'consultation': consultation,
    };
  }
}
