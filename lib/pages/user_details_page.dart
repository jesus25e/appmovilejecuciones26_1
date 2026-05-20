import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDetailsPage extends StatelessWidget {
  final UserModel user;
  const UserDetailsPage({super.key, required this.user});

  Widget item({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalle del usuario',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          item(icon: Icons.person, title: 'Nombres', value: user.nombres),
          item(
            icon: Icons.person_outline,
            title: 'Apellidos',
            value: user.apellidos,
          ),
          item(icon: Icons.badge, title: 'DNI', value: user.dni),
          item(icon: Icons.wc, title: 'Sexo', value: user.sexo),
          item(
            icon: Icons.calendar_month,
            title: 'Fecha de registro',
            value: user.registro,
          ),
          item(
            icon: Icons.location_on,
            title: 'Direccion',
            value: user.direccion,
          ),
          item(icon: Icons.email, title: 'Correo', value: user.email),
          item(icon: Icons.password, title: 'Contraseña', value: user.password),
        ],
      ),
    );
  }
}
