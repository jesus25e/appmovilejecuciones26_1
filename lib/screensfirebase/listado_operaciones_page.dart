import 'package:appmovilejecuciones26_1/blocfirebase/operacion_bloc.dart';
import 'package:appmovilejecuciones26_1/blocfirebase/operacion_event.dart';
import 'package:appmovilejecuciones26_1/blocfirebase/operacion_state.dart';
import 'package:appmovilejecuciones26_1/repositoriofirebase/operacion_repository.dart';
import 'package:appmovilejecuciones26_1/screensfirebase/detalle_operacion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListadoOperacionesPage extends StatefulWidget {
  const ListadoOperacionesPage({super.key});

  @override
  State<ListadoOperacionesPage> createState() => _ListadoOperacionesPageState();
}

class _ListadoOperacionesPageState extends State<ListadoOperacionesPage> {
  late OperacionBloc operacionBloc;

  @override
  void initState() {
    super.initState();
    operacionBloc = OperacionBloc(OperacionRepository());
    operacionBloc.add(CargarOperaciones());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: operacionBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Listado de Operaciones',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blueAccent,
          shadowColor: Colors.grey,
        ),
        body: BlocConsumer<OperacionBloc, OperacionState>(
          builder: (context, state) {
            if (state is OperacionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OperacionLoaded) {
              final operaciones = state.operaciones;
              if (operaciones.isEmpty) {
                return const Center(
                  child: Text('No hay operaciones Registradas'),
                );
              }
              return ListView.builder(
                itemCount: operaciones.length,
                itemBuilder: (context, index) {
                  final op = operaciones[index];
                  final idCtrl = TextEditingController(
                    text: (op['idOperacion'] ?? '').toString(),
                  );
                  final descCtrl = TextEditingController(
                    text: (op['descripcion'] ?? '').toString(),
                  );
                  final cantCtrl = TextEditingController(
                    text: (op['cantidad'] ?? '').toString(),
                  );
                  final montoCtrl = TextEditingController(
                    text: (op['monto'] ?? '').toString(),
                  );
                  final respCtrl = TextEditingController(
                    text: (op['responsable'] ?? '').toString(),
                  );
                  return Card(
                    child: ListTile(
                      subtitle: Text(
                        'ID:${op['idOperacion']}\n'
                        'Descripcion:${op['descripcion']}\n'
                        'Cantidad:${op['cantidad']} - Monto:${op['monto']}\n'
                        'responsable:${op['responsable']}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return BlocProvider.value(
                                    value: operacionBloc,
                                    child: AlertDialog(
                                      title: Text('Editar Operacion'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: idCtrl,
                                              decoration: InputDecoration(
                                                labelText: 'ID',
                                              ),
                                            ),
                                            TextField(
                                              controller: descCtrl,
                                              decoration: InputDecoration(
                                                labelText: 'Descripcion',
                                              ),
                                            ),
                                            TextField(
                                              controller: cantCtrl,
                                              decoration: InputDecoration(
                                                labelText: 'Cantidad',
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                            TextField(
                                              controller: montoCtrl,
                                              decoration: InputDecoration(
                                                labelText: 'Monto',
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                            TextField(
                                              controller: respCtrl,
                                              decoration: InputDecoration(
                                                labelText: 'Responsable',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Cancelar'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            operacionBloc.add(
                                              ActualizarOperacion(
                                                idDoc: op['idDoc'],
                                                idOperacion: idCtrl.text,
                                                descripcion: descCtrl.text,
                                                cantidad:
                                                    int.tryParse(
                                                      cantCtrl.text,
                                                    ) ??
                                                    0,
                                                monto:
                                                    double.tryParse(
                                                      montoCtrl.text,
                                                    ) ??
                                                    0,
                                                responsable: respCtrl.text,
                                              ),
                                            );
                                            Navigator.pop(
                                              context,
                                            ); //Cerramos la vista
                                          },
                                          child: Text('Guardar'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.blueAccent,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      DetalleOperacionPage(operacion: op),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.visibility,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('¿Eliminar Operacion?'),
                                  content: Text(
                                    'Estas seguro de eliminar esta operacion?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text('Cancelar'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: Text('Eliminar'),
                                    ),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                operacionBloc.add(
                                  EliminarOperacion(idDoc: op['idDoc']),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('Cargando datos...'));
          },
          listener: (context, state) {
            if (state is OperacionFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('error: ${state.error}')));
            } else if (state is OperacionSuccess) {
              // Navigator.of(context, rootNavigator: true).pop();
              operacionBloc.add(CargarOperaciones());
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Operacion Completa')));
            }
          },
        ),
      ),
    );
  }
}
