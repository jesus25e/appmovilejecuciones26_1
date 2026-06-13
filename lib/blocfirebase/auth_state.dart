abstract class AuthState {}

//Representa el estado inicial
class AuthInitial extends AuthState {}

//Representa el estado de carga
class AuthLoading extends AuthState {}

//Representa el estado exitoso despues de una autenticación
class AuthSuccess extends AuthState {}

//Representa un estado de fallo :c
class AuthFailure extends AuthState {
  //Almacena el mensaje de error
  final String error;
  //Constructor que recibe el mensaje de error :c
  AuthFailure(this.error);
}
