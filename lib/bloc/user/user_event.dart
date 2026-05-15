import '../../models/user_model.dart';

//Clase base de eventos
abstract class UserEvent {}

//Evento para listar usuarios
class LoadUsersEvent extends UserEvent {}

//Evento para eliminar usuario
class DeleteUserEvent extends UserEvent {
  //Propiedad
  final int id;

  //Constructor
  DeleteUserEvent(this.id);
}

//Evento para editar usuario
class UpdateUserEvent extends UserEvent {
  //Usuario actualizado
  final UserModel user;
  UpdateUserEvent(this.user);
}
