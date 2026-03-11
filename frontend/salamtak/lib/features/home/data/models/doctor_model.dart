import 'package:salamtak/core/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.id,
    required super.name,
    required super.email,
    required super.imageUrl,
    required super.specialty,
    required super.rating,
    required super.price,
    super.isFavorite,
    required super.yearsOfExperience,
    required super.numberOfPatients,
    required super.timeNextAvailable,
    required super.address,
    required super.phoneNumber,
    required super.consultation,
    required super.services,
  });

  factory DoctorModel.fromMap(
    Map<String, dynamic> m, {
    bool isFavorite = false,
  }) {
    final user =
        (m['profiles'] ?? m['user_profiles'] ?? m['users'] ?? m['user'] ?? {})
            as Map<String, dynamic>;
    print("user : $user");
    return DoctorModel(
      id: m['id'] as int,
      email: user['email'] as String? ?? '',
      name: user['username'] as String? ?? 'Unknown',
      imageUrl: m['photo'] as String? ?? '',
      specialty: (m['specialty'] ?? m['sepciality']) as String? ?? '',
      rating: (m['rating'] as num?)?.toDouble() ?? 0.0,
      price: (m['price'] as num?)?.toDouble() ?? 0.0,
      isFavorite: isFavorite,
      yearsOfExperience: m['numberOfYearsOfExperience'] as int? ?? 0,
      numberOfPatients: m['numberOfPatients'] as int? ?? 0,
      timeNextAvailable: m['timeNextAvailable'] as String? ?? '',
      address: m['address'] as String? ?? '',
      phoneNumber: m['phoneNumber'] as int? ?? 0,
      consultation: m['consultation'] as int? ?? 0,
      services:
          (m['services'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
