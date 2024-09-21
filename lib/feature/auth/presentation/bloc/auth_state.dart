class AuthState {}

class AuthInitial extends AuthState {}

// register

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}

// login

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}


// forget password

class SendForgetPasswordLoadingState extends AuthState {}

class SendForgetPasswordSuccessState extends AuthState {}

class SendForgetPasswordErrorState extends AuthState {
  final String error;
  SendForgetPasswordErrorState(this.error);
}
