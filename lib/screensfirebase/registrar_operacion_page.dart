import 'package:appmovilejecuciones26_1/blocfirebase/operacion_event.dart';
import 'package:appmovilejecuciones26_1/blocfirebase/operacion_state.dart';
import 'package:appmovilejecuciones26_1/repositoriofirebase/operacion_repository.dart';
import 'package:appmovilejecuciones26_1/screensfirebase/listado_operaciones_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocfirebase/operacion_bloc.dart';
import '../blocfirebase/auth_event.dart';
import '../blocfirebase/auth_state.dart';

class RegistrarOperacionPage extends StatelessWidget {
  final TextEditingController idCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController cantCtrl = TextEditingController();
  final TextEditingController montoCtrl = TextEditingController();
  final TextEditingController respCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OperacionBloc(OperacionRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text("Registrar Operacion")),
        body: Container(
          padding: EdgeInsets.all(20),
          child: BlocConsumer<OperacionBloc, OperacionState>(
            listener: (context, state) {
              if (state is OperacionSuccess) {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text("Operacion registrada con Exito")),
                // );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListadoOperacionesPage(),
                  ),
                );
              } else if (state is OperacionFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: ${state.error}")),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: idCtrl,
                      decoration: InputDecoration(labelText: "ID Operacion"),
                    ),
                    TextField(
                      controller: descCtrl,
                      decoration: InputDecoration(labelText: "descripción"),
                    ),
                    TextField(
                      controller: cantCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Cantidad"),
                    ),
                    TextField(
                      controller: montoCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Monto"),
                    ),
                    TextField(
                      controller: respCtrl,
                      decoration: InputDecoration(labelText: "Responsable"),
                    ),
                    SizedBox(height: 20),
                    if (state is OperacionLoading)
                      CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: () {
                          context.read<OperacionBloc>().add(
                            RegistrarOperacion(
                              idOperacion: idCtrl.text,
                              descripcion: descCtrl.text,
                              cantidad: int.tryParse(cantCtrl.text) ?? 0,
                              monto: double.tryParse(montoCtrl.text) ?? 0,
                              responsable: respCtrl.text,
                            ),
                          );
                        },
                        child: Text("Guardar"),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
