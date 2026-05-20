import '../../models/user_model.dart';

abstract class UserState {}

//Cargamos el estado inicial
class UserInitial extends UserState {}

//Estado Cargando
class UserLoading extends UserState {}

//Estado Cuando los usuarios se cargaron
class UserLoaded extends UserState {
  final List<UserModel> users;
  UserLoaded(this.users);
}

//Cuando ocurre un error
class UserFailure extends UserState {
  final String message;
  UserFailure(this.message);
}
