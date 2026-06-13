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
      } catch (e) {
        emit(OperacionFailure(e.toString()));
      }
    });
  }
}
