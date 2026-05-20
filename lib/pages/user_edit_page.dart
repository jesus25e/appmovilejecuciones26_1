import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart';
import '../bloc/user/user_state.dart';
import '../models/user_model.dart';

class UserEditPage extends StatefulWidget {
  final UserModel user;
  const UserEditPage({super.key, required this.user});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  late TextEditingController nombresController;
  late TextEditingController apellidosController;
  late TextEditingController dniController;
  late TextEditingController registroController;
  late TextEditingController direccionController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late String sexoSeleccionado;

  @override
  void initState() {
    super.initState();
    nombresController = TextEditingController(text: widget.user.nombres);
    apellidosController = TextEditingController(text: widget.user.apellidos);
    dniController = TextEditingController(text: widget.user.dni);
    registroController = TextEditingController(text: widget.user.registro);
    direccionController = TextEditingController(text: widget.user.direccion);
    emailController = TextEditingController(text: widget.user.email);
    passwordController = TextEditingController(text: widget.user.password);
    sexoSeleccionado = widget.user.sexo;
  }

  @override
  void dispose() {
    nombresController.dispose();
    apellidosController.dispose();
    dniController.dispose();
    registroController.dispose();
    direccionController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void guardarCambio() {
    final userEditado = UserModel(
      id: widget.user.id,
      nombres: nombresController.text.trim(),
      apellidos: apellidosController.text.trim(),
      dni: dniController.text.trim(),
      sexo: sexoSeleccionado,
      registro: registroController.text.trim(),
      direccion: direccionController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    context.read<UserBloc>().add(UpdateUserEvent(userEditado));
  }

  Future<void> seleccionarFecha() async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (fecha != null) {
      registroController.text = '${fecha.day}/${fecha.month}/${fecha.year}';
    }
  }

  Widget campoTexto({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        readOnly: obscureText,
        onTap: onTap,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Usuario',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              campoTexto(
                controller: nombresController,
                label: 'Nombres',
                icon: Icons.person,
              ),
              campoTexto(
                controller: apellidosController,
                label: 'Apellidos',
                icon: Icons.person_outline,
              ),
              campoTexto(
                controller: dniController,
                label: 'DNI',
                icon: Icons.badge,
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField<String>(
                value: sexoSeleccionado,
                decoration: const InputDecoration(
                  labelText: 'Sexo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.wc),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Masculino',
                    child: Text('Masculino'),
                  ),
                  DropdownMenuItem(value: 'Femenino', child: Text('Femenino')),
                ],
                onChanged: (value) {
                  setState(() {
                    sexoSeleccionado = value!;
                  });
                },
              ),
              const SizedBox(height: 15),
              campoTexto(
                controller: registroController,
                label: 'Fecha de registro',
                icon: Icons.calendar_month,
                readOnly: true,
                onTap: seleccionarFecha,
              ),
              campoTexto(
                controller: direccionController,
                label: 'Direccion',
                icon: Icons.location_on,
              ),
              campoTexto(
                controller: emailController,
                label: 'Correo',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              campoTexto(
                controller: passwordController,
                label: 'Contraseña',
                icon: Icons.password,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              if (state is UserLoading)
                const Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: guardarCambio,
                  child: const Text('Guardar Cambios'),
                ),
            ],
          );
        },
        listener: (context, state) {
          if (state is UserLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Usuario Actualizado correctamente'),
              ),
            );
            Navigator.pop(context, true);
          }
          if (state is UserFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }
}
