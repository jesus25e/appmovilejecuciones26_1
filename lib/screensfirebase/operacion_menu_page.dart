import 'package:appmovilejecuciones26_1/screensfirebase/buscar_usuario_page.dart';
import 'package:appmovilejecuciones26_1/screensfirebase/consumo_api_page.dart';
import 'package:appmovilejecuciones26_1/screensfirebase/listado_operaciones_page.dart';
import 'package:appmovilejecuciones26_1/screensfirebase/registrar_operacion_page.dart';
import 'package:flutter/material.dart';

class OperacionMenuPage extends StatelessWidget {
  const OperacionMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu de Operaciones',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Registrar Operaciones'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegistrarOperacionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.list),
              label: const Text('ver listado de operaciones'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListadoOperacionesPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ConsumoApiPage()),
                );
              },
              icon: Icon(Icons.cloud_download),
              label: const Text("Consumir API desde Internet"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BuscarUsuarioPage()),
                );
              },
              label: const Text("Buscar Usuario por ID"),
              icon: const Icon(Icons.search),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
