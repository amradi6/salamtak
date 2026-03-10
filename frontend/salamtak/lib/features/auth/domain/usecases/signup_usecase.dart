import 'package:dartz/dartz.dart';
import 'package:salamtak/core/errors/failures.dart';
import 'package:salamtak/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository _authRepository;

  SignupUseCase(this._authRepository);

  Future<Either<Failure, void>> call(SignupUseCaseParams params) {
    return _authRepository.signUp(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}

class SignupUseCaseParams {
  final String email;
  final String password;
  final String username;

  SignupUseCaseParams({
    required this.email,
    required this.password,
    required this.username,
  });
}
