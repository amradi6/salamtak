import 'package:dartz/dartz.dart';
import 'package:salamtak/core/errors/failures.dart';
import 'package:salamtak/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<Failure, void>> call(LoginParams params)  {
    return  _authRepository.logIn(email: params.email, password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});
}