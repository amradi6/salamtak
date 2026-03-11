import 'package:dartz/dartz.dart';
import 'package:salamtak/core/entities/doctor_entity.dart';
import 'package:salamtak/core/errors/failures.dart';
import 'package:salamtak/features/home/domain/repositories/home_repository.dart';

class GetPopularDoctorsUseCase {
  final HomeRepository _homeRepository;

  GetPopularDoctorsUseCase(this._homeRepository);

  Future<Either<Failure, List<DoctorEntity>>> call() async {
    return await _homeRepository.getPopularDoctors();
  }
}

class GetDoctorsBySpecialtyUseCase {
  final HomeRepository _homeRepository;

  GetDoctorsBySpecialtyUseCase(this._homeRepository);

  Future<Either<Failure, List<DoctorEntity>>> call(String specialty) async {
    return await _homeRepository.getDoctorsBySpecialty(specialty);
  }
}
