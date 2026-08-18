abstract class OperacionEvent {}

class RegistrarOperacion extends OperacionEvent {
  final String idOperacion;
  final String descripcion;
  final int cantidad;
  final double monto;
  final String responsable;
  RegistrarOperacion({
    required this.idOperacion,
    required this.descripcion,
    required this.cantidad,
    required this.monto,
    required this.responsable,
  });
}

class CargarOperaciones extends OperacionEvent {}

class ActualizarOperacion extends OperacionEvent {
  final String idDoc;
  final String idOperacion;
  final String descripcion;
  final int cantidad;
  final double monto;
  final String responsable;
  ActualizarOperacion({
    required this.idDoc,
    required this.idOperacion,
    required this.descripcion,
    required this.cantidad,
    required this.monto,
    required this.responsable,
  });
}

class EliminarOperacion extends OperacionEvent {
  final String idDoc;
  EliminarOperacion({required this.idDoc});
}

class VerOperacion extends OperacionEvent {
  final Map<String, dynamic> operacion;
  VerOperacion({required this.operacion});
}
