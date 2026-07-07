import 'package:appmovilejecuciones26_1/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocfirebase/api_bloc.dart';
import '../blocfirebase/api_event.dart';
import '../blocfirebase/api_state.dart';

//Pantalla que muestra los resultados del consumo del api
class ConsumoApiPage extends StatelessWidget {
  const ConsumoApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //Se crea el bloc y se lanza el evento para consumir el api
      create: (_) => ApiBloc(ApiRepository())..add(FetchDataEvent()),
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
        body: BlocBuilder<ApiBloc, ApiState>(
          builder: (context, state) {
            if (state is ApiLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            //Muestra los datos si es exitoso
            else if (state is ApiLoadedState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final item = state.data[index]; //Obtenemos los usuarios
                  return ListTile(
                    title: Text(item['firstName'] ?? 'Sin Nombre'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['email'] ?? 'Sin email'),
                        Text(item['phone'] ?? 'Sin Telefono'),
                        Text(item['address']?['city'] ?? 'Sin Ciudad'),
                      ],
                    ),
                  );
                },
              );
            }
            //Error
            else if (state is ApiErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Esperando Acciones ....'));
            }
          },
        ),
      ),
    );
  }
}
