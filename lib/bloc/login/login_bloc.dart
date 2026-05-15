import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/user_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // Rpositorio para comunicarse con SQLite
  final UserRepository userRepository;
  LoginBloc(this.userRepository) : super(LoginInitial()) {
    //Escucha el evento para iniciar sesion
    on<LoginSubmitted>((event, emit) async {
      //emitimos Estado de carga
      emit(LoginLoading());
      try {
        //Busca user
        final user = await userRepository.login(event.email, event.password);
        // existe
        if (user != null) {
          //emite success
          emit(LoginSuccess(user));
        } else {
          //Error de credenciales
          emit(LoginFailure('Email o contraseña incorrecto'));
        }
      } catch (e) {
        emit(LoginFailure('Error al iniciar sesión $e'));
      }
    });
    //Evento para registrar usuario
    on<RegisterSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        await userRepository.register(event.user);
        emit(RegisterSuccess());
      } catch (e) {
        emit(
          LoginFailure('Ya existe un usuario con el DNI/EMAIL ya fue usado'),
        );
      }
    });
  }
}
