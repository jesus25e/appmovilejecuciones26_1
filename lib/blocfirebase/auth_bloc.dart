import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../firebase_auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //Referencia al repo de autenticacion con Firebase
  final FirebaseAuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    //Maneja el evento LoginRequested
    on<LoginRequested>((event, emit) async {
      //Emite un estado de carga mientras se procesa el login
      emit(AuthLoading());
      try {
        await authRepo.signIn(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure('Login Error: ${e.toString()}'));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepo.register(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure('Registrar Error: ${e.toString()}'));
      }
    });

    //Maneja el evento LogoutRequested
    on<LogoutRequested>((event, emit) async {
      //Cierra sesion del usuario usando el repo
      await authRepo.signOut();
      //Emite el estado inicial nuevamente :D
      emit(AuthInitial());
    });
  }
}
