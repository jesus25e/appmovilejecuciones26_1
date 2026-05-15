// Importamos el modelo de usuario
import '../../models/user_model.dart';

// Clase base de todos los eventos login
abstract class LoginEvent {}

// Evento para iniciar sesion
class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
  LoginSubmitted({required this.email, required this.password});
}

// Evento para registrar usuario
class RegisterSubmitted extends LoginEvent {
  final UserModel user;
  // Constructor del evento RegisterSubmited
  RegisterSubmitted({required this.user});
}
