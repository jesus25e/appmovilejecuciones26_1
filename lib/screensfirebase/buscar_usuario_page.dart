// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocfirebase/usuario_bloc.dart';
// import '../blocfirebase/usuario_event.dart';
// import '../blocfirebase/usuario_state.dart';
// import '../repositories/api_repository.dart';

// class BuscarUsuarioPage extends StatelessWidget {
//   BuscarUsuarioPage({super.key});
//   final TextEditingController idCtrl = TextEditingController();
//   //Creamos los controladores para cada campo de JSON
//   final Map<String, TextEditingController> controllers = {
//     "firstName": TextEditingController(),
//     "lastName": TextEditingController(),
//     "maidenName": TextEditingController(),
//     "age": TextEditingController(),
//     "gender": TextEditingController(),
//     "email": TextEditingController(),
//     "phone": TextEditingController(),
//     "username": TextEditingController(),
//     "birthDate": TextEditingController(),
//     "bloodGroup": TextEditingController(),
//     "height": TextEditingController(),
//     "weight": TextEditingController(),
//     "eyeColor": TextEditingController(),
//     "hairColor": TextEditingController(),
//     "hairType": TextEditingController(),
//   };

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => UsuarioBloc(ApiRepository()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Buscar Usuario por ID",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//           ),
//           iconTheme: IconThemeData(color: Colors.white),
//           backgroundColor: Colors.blueAccent,
//           shadowColor: Colors.grey,
//         ),
//         body: BlocConsumer<UsuarioBloc, UsuarioState>(
//           builder: (context, state) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ListView(
//                 children: [
//                   TextField(
//                     controller: idCtrl,
//                     decoration: InputDecoration(labelText: "Id del Usuario"),
//                     keyboardType: TextInputType.name,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       final id = int.tryParse(idCtrl.text);
//                       if (id != null) {
//                         context.read<UsuarioBloc>().add(
//                           BuscarUsuarioPorIdEvent(id),
//                         );
//                       }
//                     },
//                     child: const Text("Buscar"),
//                   ),
//                   ...controllers.entries.map(
//                     (entry) => TextField(
//                       controller: entry.value,
//                       decoration: InputDecoration(labelText: entry.key),
//                       readOnly: true,
//                     ),
//                   ),
//                   if (state is UsuarioLoadingState)
//                     const CircularProgressIndicator(),
//                   if (state is UsuarioErrorState)
//                     Text(
//                       state.mensaje,
//                       style: const TextStyle(color: Colors.red),
//                     ),
//                 ],
//               ),
//             );
//           },
//           listener: (context, state) {
//             if (state is UsuarioLoadedState) {
//               final usuario = state.usuario;
//               controllers['firstName']!.text = usuario['firstName'] ?? '';
//               controllers['lastName']!.text = usuario['lastName'] ?? '';
//               controllers['maidenName']!.text = usuario['maidenName'] ?? '';
//               controllers['age']!.text = usuario['age'] ?? '';
//               controllers['gender']!.text = usuario['gender'] ?? '';
//               controllers['email']!.text = usuario['email'] ?? '';
//               controllers['phone']!.text = usuario['phone'] ?? '';
//               controllers['username']!.text = usuario['username'] ?? '';
//               controllers['birthDate']!.text = usuario['birthDate'] ?? '';
//               controllers['bloodGroup']!.text = usuario['bloodGroup'] ?? '';
//               controllers['height']!.text = usuario['height'].toString();
//               controllers['weight']!.text = usuario['weight'].toString();
//               controllers['eyeColor']!.text = usuario['eyeColor'] ?? '';
//               controllers['hairColor']!.text = usuario['hairColor'] ?? '';
//               controllers['hairType']!.text = usuario['hairType'] ?? '';
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:appmovilejecuciones26_1/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocfirebase/usuario_bloc.dart';
import '../blocfirebase/usuario_event.dart';
import '../blocfirebase/usuario_state.dart';

class BuscarUsuarioPage extends StatelessWidget {
  BuscarUsuarioPage({super.key});
  final TextEditingController idController = TextEditingController();
  //Creamos los controladores para cada campo de JSON
  final Map<String, TextEditingController> controllers = {
    "firstName": TextEditingController(),
    "lastName": TextEditingController(),
    "maidenName": TextEditingController(),
    "age": TextEditingController(),
    "gender": TextEditingController(),
    "email": TextEditingController(),
    "phone": TextEditingController(),
    "username": TextEditingController(),
    "birthDate": TextEditingController(),
    "bloodGroup": TextEditingController(),
    "height": TextEditingController(),
    "weight": TextEditingController(),
    "eyeColor": TextEditingController(),
    "hairColor": TextEditingController(),
    "hairType": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsuarioBloc(ApiRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Buscar Usuario por ID',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blueAccent,
          shadowColor: Colors.grey,
        ),
        body: BlocConsumer<UsuarioBloc, UsuarioState>(
          listener: (context, state) {
            if (state is UsuarioLoadedState) {
              final usuario = state.usuario;
              controllers['firstName']!.text = usuario['firstName'] ?? '';
              controllers['lastName']!.text = usuario['lastName'] ?? '';
              controllers['maidenName']!.text = usuario['maidenName'] ?? '';
              controllers['age']!.text = usuario['age'].toString();
              controllers['gender']!.text = usuario['gender'] ?? '';
              controllers['email']!.text = usuario['email'] ?? '';
              controllers['phone']!.text = usuario['phone'] ?? '';
              controllers['username']!.text = usuario['username'] ?? '';
              controllers['birthDate']!.text = usuario['birthDate'] ?? '';
              controllers['bloodGroup']!.text = usuario['bloodGroup'] ?? '';
              controllers['height']!.text = usuario['height'].toString();
              controllers['weight']!.text = usuario['weight'].toString();
              controllers['eyeColor']!.text = usuario['eyeColor'] ?? '';
              controllers['hairColor']!.text = usuario['hairColor'] ?? '';
              controllers['hairType']!.text = usuario['hairType'] ?? '';
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(labelText: 'Id del Usuario'),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final id = int.tryParse(idController.text);
                      if (id != null) {
                        context.read<UsuarioBloc>().add(
                          BuscarUsuarioPorIdEvent(id),
                        );
                      }
                    },
                    child: const Text('Buscar'),
                  ),
                  ...controllers.entries.map(
                    (entry) => TextField(
                      controller: entry.value,
                      decoration: InputDecoration(labelText: entry.key),
                      readOnly: true,
                    ),
                  ),
                  if (state is UsuarioLoadingState)
                    const CircularProgressIndicator(),
                  if (state is UsuarioErrorState)
                    Text(
                      state.mensaje,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
