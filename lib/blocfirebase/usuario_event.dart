abstract class UsuarioEvent {}

class BuscarUsuarioPorIdEvent extends UsuarioEvent {
  final int id;
  BuscarUsuarioPorIdEvent(this.id);
}

class GuardarUsuarioFirebaseEvent extends UsuarioEvent {
  final Map<String, dynamic> usuario;
  GuardarUsuarioFirebaseEvent(this.usuario);
}

class LimpiarUsuarioEvent extends UsuarioEvent {}
