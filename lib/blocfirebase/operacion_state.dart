abstract class OperacionState {}

class OperacionInitial extends OperacionState {}

class OperacionLoading extends OperacionState {}

class OperacionSuccess extends OperacionState {}

class OperacionFailure extends OperacionState {
  final String error;
  OperacionFailure(this.error);
}

class OperacionLoaded extends OperacionState {
  final List<Map<String, dynamic>> operaciones;
  OperacionLoaded(this.operaciones);
}

class OperacionDetalleLoaded extends OperacionState {
  final Map<String, dynamic> operacion;
  OperacionDetalleLoaded(this.operacion);
}
