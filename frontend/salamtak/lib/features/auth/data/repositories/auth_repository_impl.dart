import 'package:dartz/dartz.dart';
import 'package:salamtak/core/errors/failures.dart';
import 'package:salamtak/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:salamtak/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl(this._authRemoteDatasource);

  @override
  String? get currentUserId => _authRemoteDatasource.currentUserId;

  @override
  bool get isLoggedIn => _authRemoteDatasource.isLoggedIn;

  @override
  Future<Either<Failure, void>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _authRemoteDatasource.logIn(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await _authRemoteDatasource.logOut();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await _authRemoteDatasource.signup(
        email: email,
        password: password,
        username: username,
      );
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
