//Clase abstracta que representa los eventos relacionados
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested(this.email, this.password);
}

//Evento que se lanza cuando el usuario solicita registrarse
class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  RegisterRequested(this.email, this.password);
}

//Evento que se lanza cuando un usuario desea cerrar sesion
class LogoutRequested extends AuthEvent {}
