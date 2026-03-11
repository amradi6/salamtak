import 'package:dartz/dartz.dart';
import 'package:salamtak/core/entities/doctor_entity.dart';
import 'package:salamtak/core/errors/failures.dart';
import 'package:salamtak/features/home/data/datasources/home_remote_datasource.dart';
import 'package:salamtak/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsBySpecialty(
    String specialty,
  ) async {
    try {
      return Right(await _remoteDataSource.getDoctorsBySpecialty(specialty));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getPopularDoctors() async {
    try {
      return Right(await _remoteDataSource.getPopularDoctors());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
