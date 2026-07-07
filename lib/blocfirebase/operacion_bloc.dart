import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositoriofirebase/operacion_repository.dart';
import 'operacion_event.dart';
import 'operacion_state.dart';

class OperacionBloc extends Bloc<OperacionEvent, OperacionState> {
  final OperacionRepository repo;
  OperacionBloc(this.repo) : super(OperacionInitial()) {
    on<RegistrarOperacion>((event, emit) async {
      emit(OperacionLoading());
      try {
        await repo.RegistrarOperacion(
          idOperacion: event.idOperacion,
          descripcion: event.descripcion,
          cantidad: event.cantidad,
          monto: event.monto,
          responsable: event.responsable,
        );
        emit(OperacionSuccess());
      } catch (e) {
        emit(OperacionFailure(e.toString()));
      }
    });

    on<CargarOperaciones>((event, emit) async {
      emit(OperacionLoading());
      try {
        final operaciones = await repo.obtenerOperaciones();
        emit(OperacionLoaded(operaciones));
      } catch (e) {
        emit(OperacionFailure(e.toString()));
      }
    });

    on<ActualizarOperacion>((event, emit) async {
      emit(OperacionLoading());
      try {
        await repo.actualizarOperacion(
          idDoc: event.idDoc,
          idOperacion: event.idOperacion,
          descripcion: event.descripcion,
          cantidad: event.cantidad,
          monto: event.monto,
          responsable: event.responsable,
        );
        emit(OperacionSuccess());
      } catch (e) {
        emit(OperacionFailure(e.toString()));
      }
    });

    on<EliminarOperacion>((event, emit) async {
      emit(OperacionLoading());
      try {
        await repo.eliminarOperacion(event.idDoc);
        emit(OperacionSuccess());
      } catch (e) {
        emit(OperacionFailure(e.toString()));
      }
    });
  }
}
