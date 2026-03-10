import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/auth/domain/usecases/login_usecase.dart';
import 'package:salamtak/features/auth/domain/usecases/logout_usecase.dart';
import 'package:salamtak/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _login;
  final SignupUseCase _signup;
  final LogoutUseCase _logout;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required SignupUseCase signupUseCase,
    required LogoutUseCase logoutUseCase,
  }) : _login = loginUseCase,
       _signup = signupUseCase,
       _logout = logoutUseCase,
       super(AuthInitial());

  final TextEditingController nameController = TextEditingController();
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    emit(PasswordVisibilityChanged(_obscurePassword));
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(LogInLoading());
    final result = await _login(LoginParams(email: email, password: password));
    result.fold(
      (f) => emit(LogInError(f.message)),
      (_) => emit(LogInSuccess()),
    );
  }

  Future<void> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(SingUpLoading());
    final result = await _signup(
      SignupUseCaseParams(
        email: email,
        password: password,
        username: username,
      ),
    );
    result.fold(
      (f) => emit(SingUpError(f.message)),
      (_) => emit(SingUpSuccess()),
    );
  }

  Future<void> logout(BuildContext context) async {
    final result = await _logout();
    result.fold(
      (f) => emit(LogInError(f.message)),
      (_) => Navigator.pushReplacementNamed(context, '/login'),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }
}
