import 'package:appmovilejecuciones26_1/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_event.dart';
import 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiRepository repository;
  ApiBloc(this.repository) : super(ApiInitial()) {
    //Maneja el evento de la carga de datos
    on<FetchDataEvent>((event, emit) async {
      emit(ApiLoadingState()); //Muestra el progreso
      try {
        final data = await repository.fetchData(); //Llamamos al repostorio
        emit(ApiLoadedState(data));
      } catch (e, stacktrace) {
        print('Error Detallado:$e');
        print('TRACE: $stacktrace');
        emit(ApiErrorState('Error:$e')); //Emite el msj de error
      }
    });
  }
}
