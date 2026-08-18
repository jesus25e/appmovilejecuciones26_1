abstract class UsuarioState {}

class UsuarioInitialState extends UsuarioState {}

class UsuarioLoadingState extends UsuarioState {}

class UsuarioLoadedState extends UsuarioState {
  //Propiedad que almacena la información del usuario :D
  final Map<String, dynamic> usuario;
  UsuarioLoadedState(this.usuario);
}

class UsuarioErrorState extends UsuarioState {
  final String mensaje;
  UsuarioErrorState(this.mensaje);
}

class UsuarioGuardandoState extends UsuarioState {
  final Map<String, dynamic> usuario;
  UsuarioGuardandoState(this.usuario);
}

class UsuarioGuardadoState extends UsuarioState {}
