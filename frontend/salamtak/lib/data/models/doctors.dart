class Doctors {
  final int id;
  final String name;
  final String image;
  final String specialty;
  final double rating;
  final double price;
  bool? isFavorite;
  final bool isPopular;
  final bool isFeatured;
  final int numberOfYearsOfExperience;
  final int numberOfPatients;
  final String timeNextAvailable;

  Doctors({
    required this.id,
    required this.name,
    required this.image,
    required this.specialty,
    required this.rating,
    required this.price,
    this.isFavorite=false,
    required this.isPopular,
    required this.isFeatured,
    required this.numberOfYearsOfExperience,
    required this.numberOfPatients,
    required this. timeNextAvailable,
  });

  factory Doctors.fromMap(Map<String, dynamic> map) {
    final user = map['user'] ?? {};
    return Doctors(
      id: map['id'],
      image: map['photo']??"assets/images/doctor1.png",
      name: user['username']??"User Name",
      specialty: map['sepciality'] ?? '',
      rating: double.tryParse(map['rating'] ?? "0.0") ?? 0.0,
      price: double.tryParse(map['price'] ?? "0.0") ?? 0.0,
      isFavorite: map['favorite'],
      isPopular: map['isPopular'] ?? false,
      isFeatured: map['isFeatured'] ?? false,
      numberOfYearsOfExperience: map['numberOfYearsOfExperience'] ?? 0,
      numberOfPatients: map['numberOfPatients'] ?? 0,
      timeNextAvailable: map['timeNextAvailable'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'image': image,
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'price': price,
      'favorite': isFavorite,
      'isPopular': isPopular,
      'isFeatured': isFeatured,
      'numberOfYearsOfExperience': numberOfYearsOfExperience,
      'numberOfPatients': numberOfPatients,
      'timeNextAvailable': timeNextAvailable,
    };
  }
}
