import 'package:appmovilejecuciones26_1/repositoriofirebase/firebase_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/api_repository.dart';
import 'usuario_event.dart';
import 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final ApiRepository repository;
  final FirebaseUserRepository firebaseRepository = FirebaseUserRepository();

  UsuarioBloc(this.repository) : super(UsuarioInitialState()) {
    on<BuscarUsuarioPorIdEvent>((event, emit) async {
      //Emitimos un estado de carga
      emit(UsuarioLoadingState());
      try {
        final user = await repository.fetchById(event.id);
        //Emitimos un estado exitoso
        emit(UsuarioLoadedState(user));
      } catch (e) {
        //Si ocurre un error llamamos al estado Error
        emit(UsuarioErrorState(e.toString()));
      }
    });
    on<GuardarUsuarioFirebaseEvent>(_guardarUsuarioFirebase);
    on<LimpiarUsuarioEvent>(_limpiar);
  }
  //Guardar Usuario en firebase
  Future<void> _guardarUsuarioFirebase(
    GuardarUsuarioFirebaseEvent event,
    Emitter<UsuarioState> emit,
  ) async {
    try {
      emit(UsuarioGuardandoState(event.usuario));
      await firebaseRepository.guardarUsuario(event.usuario);
      emit(UsuarioGuardadoState());
      emit(UsuarioLoadedState(event.usuario));
    } catch (e) {
      emit(UsuarioErrorState("Error al guardar en firebase: ${e.toString()} "));
    }
  }

  void _limpiar(LimpiarUsuarioEvent event, Emitter<UsuarioState> emit) {
    emit(UsuarioInitialState());
  }
}
