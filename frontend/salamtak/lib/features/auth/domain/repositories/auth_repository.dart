import 'package:dartz/dartz.dart';
import 'package:salamtak/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> logIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
    required String username,
  });

  Future<Either<Failure, void>> logOut();

  bool get isLoggedIn;

  String? get currentUserId;
}
