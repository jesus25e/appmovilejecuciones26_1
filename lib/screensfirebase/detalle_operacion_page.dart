import 'package:flutter/material.dart';

class DetalleOperacionPage extends StatelessWidget {
  final Map<String, dynamic> operacion;
  const DetalleOperacionPage({super.key, required this.operacion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de la operación"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _item("ID", operacion['idOperacion']),
                _item("Description", operacion['descripcion']),
                _item("Cantidad", operacion['cantidad']),
                _item("Monto", operacion['monto']),
                _item("Responsable", operacion['responsable']),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Volver al listado"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _item(String titulo, dynamic valor) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Text(
      "$titulo: ${valor ?? ''}",
      style: const TextStyle(fontSize: 18),
    ),
  );
}
