import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:salamtak/features/auth/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  final TextEditingController nameController = TextEditingController();

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
        final data = jsonDecode(response.body);
        final usernameFromApi = data['username'] ?? username;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', usernameFromApi);

        emit(SingUpSuccess());
      } else {
        final errorData = jsonDecode(response.body);
        String errorMessage = 'SignUp failed.';

        if (errorData is Map<String, dynamic>) {
          final errors = <String>[];

          errorData.forEach((key, value) {
            if (value is List && value.isNotEmpty) {
              errors.add('$key: ${value.first}');
            }
          });

          errorMessage = errors.join('\n');
        }
        emit(SingUpError(errorMessage));
      }
    } catch (e) {
      emit(SingUpError('Unexpected error occurred. Please try again.'));
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
        final errorData = jsonDecode(response.body);
        String errorMessage = 'LogIn failed.';

        if (errorData is Map<String, dynamic>) {
          final errors = <String>[];

          errorData.forEach((key, value) {
            if (value is List && value.isNotEmpty) {
              errors.add('$key: ${value.first}');
            }
          });

          errorMessage = errors.join('\n');
        }
        emit(LogInError(errorMessage));
      }
    } catch (e) {
      emit(LogInError('Unexpected error occurred. Please try again.'));
    }
  }

  Future<void> saveDisplayName(String name) async {
    final displayName = name.trim();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('displayName', displayName);
  }

  Future<String> get displayName async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('displayName') ?? 'User';
  }
}
