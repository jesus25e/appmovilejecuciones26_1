import '../../models/user_model.dart';

// Clase de todos los estados
abstract class LoginState {}

// Estado inicial
class LoginInitial extends LoginState {}

// Estado de Carga
class LoginLoading extends LoginState {}

//Estado cuando el login es correcto
class LoginSuccess extends LoginState {
  final UserModel user;
  LoginSuccess(this.user);
}

// Estado registro correcto
class RegisterSuccess extends LoginState {}

// Estado error
class LoginFailure extends LoginState {
  // Mensaje de error
  final String message;
  LoginFailure(this.message);
}
