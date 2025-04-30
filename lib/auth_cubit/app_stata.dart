sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class FailedToRegisterState extends AuthState {
  String message;
  FailedToRegisterState({required this.message});
}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class FailedToLoginState extends AuthState {
  String message;
  FailedToLoginState({required this.message});
}
