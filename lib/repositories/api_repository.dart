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
}
