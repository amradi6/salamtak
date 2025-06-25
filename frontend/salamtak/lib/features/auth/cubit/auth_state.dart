abstract class AuthState {}

class AuthInitial extends AuthState {}

class SingUpLoading extends AuthState{}

class SingUpSuccess extends AuthState{}

class SingUpError extends AuthState{
  final String message;
  SingUpError(this.message);
}