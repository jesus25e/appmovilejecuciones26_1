import 'dart:convert';
import 'package:http/http.dart' as http;

//Clase que gestiona la conexion HTTP al API externo
class ApiRepository {
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));
      print('STATUS:\${response.statusCode}');
      print('BODY:\${response.body}');
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return decoded['users'];
      } else {
        throw Exception(
          'Error HTTP \${response.statusCode} - \${response.reasonPhrase}',
        );
      }
    } catch (e) {
      print('Error en FETCH:\$e');
      throw Exception('Error en consumir la API');
    }
  }

  Future<Map<String, dynamic>> fetchById(int id) async {
    try {
      //Realizamos una solicitud HTTO get a la url con el id del usuario
      final res = await http.get(Uri.parse("https://dummyjson.com/users/$id"));
      //Si la respuesta es exitosa(codigo 200)
      if (res.statusCode == 200) {
        return jsonDecode(res.body); //Devuelve los datos en formato JSON
      } else {
        throw Exception("Usuario no encontrado");
      }
    } catch (e) {
      throw Exception("Error en buscar por ID");
    }
  }
}
