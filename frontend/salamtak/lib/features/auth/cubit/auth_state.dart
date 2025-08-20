abstract class AuthState {}

class AuthInitial extends AuthState {}

class SingUpLoading extends AuthState{}

class SingUpSuccess extends AuthState{}

class SingUpError extends AuthState{
  final String message;
  SingUpError(this.message);
}

class PasswordVisibilityChanged extends AuthState {
  final bool obscurePassword;
  PasswordVisibilityChanged(this.obscurePassword);
}

class LogInLoading extends AuthState{}

class LogInSuccess extends AuthState{}

class LogInError extends AuthState{
  final String message;
  LogInError(this.message);
}
