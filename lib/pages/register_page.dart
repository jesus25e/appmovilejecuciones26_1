import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  //Creamos constructor
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Creamos controladores

  final nombresController = TextEditingController();
  final apellidosController = TextEditingController();
  final dniController = TextEditingController();
  final registroController = TextEditingController();
  final direccionController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String sexoSeleccionado = 'Masculino';

  //Liberamos memoria cuando cerramos la pantalla

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

  //Funcion para registrar usuario
  void registrarUsuario() {
    final nombres = nombresController.text.trim();
    final apellidos = apellidosController.text.trim();
    final dni = dniController.text.trim();
    final registro = registroController.text.trim();
    final direccion = direccionController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    //validamos que ningun campo este vacio
    if (nombres.isEmpty ||
        apellidos.isEmpty ||
        dni.isEmpty ||
        registro.isEmpty ||
        direccion.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      mostrarMensaje('Complete todos los campos');
      return;
    }

    //Creamos el objeto user
    final user = UserModel(
      nombres: nombres,
      apellidos: apellidos,
      dni: dni,
      sexo: sexoSeleccionado,
      registro: registro,
      direccion: direccion,
      email: email,
      password: password,
    );

    context.read<LoginBloc>().add(RegisterSubmitted(user: user));
  }

  void mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  Future<void> seleccionarFecha() async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (fecha != null) {
      registroController.text = '${fecha.day}/${fecha.month}/${fecha.year}';
    }
  }

  //Construimos la UI :D
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Usuario'),
        backgroundColor: Colors.blueAccent,
      ),
      //Bloc Consumer y estados
      body: BlocConsumer<LoginBloc, LoginState>(
        //Builder para dibujar la pantalla
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsetsGeometry.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.person_add,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 20), //salto de linea
                  //Campo Nombre
                  TextField(
                    controller: nombresController,
                    decoration: const InputDecoration(
                      labelText: "Nombres",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Apellido
                  TextField(
                    controller: apellidosController,
                    decoration: const InputDecoration(
                      labelText: "Apellidos",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Campo dni
                  TextField(
                    controller: dniController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'DNI',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.badge),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                      DropdownMenuItem(
                        value: 'femenino',
                        child: Text('Femenino'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        sexoSeleccionado = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: registroController,
                    readOnly: true,
                    onTap: seleccionarFecha,
                    decoration: const InputDecoration(
                      labelText: 'Fecha de registro',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Campo direccion
                  TextField(
                    controller: direccionController,
                    decoration: const InputDecoration(
                      labelText: 'Direccion',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Si esta cargando que muestre loading
                  if (state is LoginLoading)
                    const CircularProgressIndicator()
                  else
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: registrarUsuario,
                        child: const Text('Registrar Usuario'),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterSuccess) {
            mostrarMensaje('Usuario registrado correctamente');
            //Regresamos al Login
            Navigator.pop(context);
          }
          if (state is LoginFailure) {
            mostrarMensaje(state.message);
          }
        },
      ),
    );
  }
}
