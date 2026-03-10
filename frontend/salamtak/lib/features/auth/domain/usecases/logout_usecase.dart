import 'package:dartz/dartz.dart';
import 'package:salamtak/core/errors/failures.dart';
import 'package:salamtak/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Either<Failure, void>> call() {
    return _authRepository.logOut();
  }
}