part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LogInLoading extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInError extends AuthState {
  final String message;

  LogInError(this.message);
}

final class SingUpLoading extends AuthState {}

final class SingUpSuccess extends AuthState {}

final class SingUpError extends AuthState {
  final String message;

  SingUpError(this.message);
}

final class PasswordVisibilityChanged extends AuthState {
  final bool isObscure;

  PasswordVisibilityChanged(this.isObscure);
}
