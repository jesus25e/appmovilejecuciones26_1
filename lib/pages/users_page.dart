import 'package:appmovilejecuciones26_1/pages/user_details_page.dart';
import 'package:appmovilejecuciones26_1/pages/user_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart';
import '../bloc/user/user_state.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key}); //constructor

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado de Usuarios',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserLoaded) {
            if (state.users.isEmpty) {
              return const Center(child: Text('No hay usuarios registrados'));
            }
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('${user.nombres} ${user.apellidos}'),
                    subtitle: Text('DNI: ${user.dni}\nCorreo: ${user.email}'),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UserDetailsPage(user: user),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.orange,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UserEditPage(user: user),
                              ),
                            );
                            if (result == true) {
                              context.read<UserBloc>().add(LoadUsersEvent());
                            }
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blueAccent,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Eliminar Usuario'),
                                content: const Text(
                                  '¿Seguro que deseas eliminar el usuario?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      context.read<UserBloc>().add(
                                        DeleteUserEvent(user.id!),
                                      );
                                    },
                                    child: const Text('Eliminar'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state is UserFailure) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Presione para cargar usuario'));
        },
      ),
    );
  }
}
