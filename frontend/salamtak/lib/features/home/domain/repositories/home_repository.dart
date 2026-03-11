import 'package:dartz/dartz.dart';
import 'package:salamtak/core/entities/doctor_entity.dart';
import 'package:salamtak/core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<DoctorEntity>>> getPopularDoctors();

  Future<Either<Failure, List<DoctorEntity>>> getDoctorsBySpecialty(
    String specialty,
  );
}
