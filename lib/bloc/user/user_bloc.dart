import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserFailure('Error al listar los usuarios'));
      }
    });
    on<UpdateUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        await userRepository.updateUser(event.user);
        final users = await userRepository.getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserFailure('Error al actualizar usuario'));
      }
    });

    on<DeleteUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        await userRepository.deleteUser(event.id);
        final users = await userRepository.getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserFailure('Error al eliminar al usuario'));
      }
    });
  }
}
