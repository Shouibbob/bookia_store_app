import 'package:bookia_store_app/feature/auth/data/models/request/login_params.dart';
import 'package:bookia_store_app/feature/auth/data/models/request/register_params.dart';

class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final RegisterParams params;

  RegisterEvent(this.params);
}

class LoginEvent extends AuthEvent {
  final LoginParams params;

  LoginEvent(this.params);
}
