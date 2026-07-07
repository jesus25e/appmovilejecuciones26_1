abstract class ApiState {}

//Estado para inicializar
class ApiInitial extends ApiState {}

//Estado para Carga
class ApiLoadingState extends ApiState {}

//Estado para contener los datos recibidos
class ApiLoadedState extends ApiState {
  final List<dynamic> data; //obtener una lista de datos de los usuarios
  ApiLoadedState(this.data);
}

class ApiErrorState extends ApiState {
  final String message;
  ApiErrorState(this.message);
}
