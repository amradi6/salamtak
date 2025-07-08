import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/features/auth/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    emit(PasswordVisibilityChanged(_obscurePassword));
  }

  Future<void> signup({
    required String email,
    required String password1,
    required String password2,
    required String username,
  }) async {
    emit(SingUpLoading());
    try {
      final response = await http.post(
        Uri.parse(
          'https://mohammadhussien.pythonanywhere.com/api/auth/registration/',
        ),
        body: {
          'email': email,
          'password1': password1,
          'password2': password2,
          'username': username,
        },
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SingUpSuccess());
      } else {
        emit(SingUpError('Signup failed'));
      }
    } catch (e) {
      emit(SingUpError('Error: $e'));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(LogInLoading());
    try {
      final response = await http.post(
        Uri.parse('https://mohammadhussien.pythonanywhere.com/api/auth/login/'),
        body: {'email': email, 'password': password},
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(LogInSuccess());
      } else {
        emit(LogInError('Login failed'));
      }
    } catch (e) {
      emit(LogInError('Error: $e'));
    }
  }
}
