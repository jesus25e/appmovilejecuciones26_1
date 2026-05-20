import '../database/database_helper.dart';
import '../models/user_model.dart';

//Conectamos Bloc con SQLite
class UserRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instace;
  Future<UserModel?> login(String email, String password) {
    return _databaseHelper.login(email, password);
  }

  //Registro de varios usuarios
  Future<int> register(UserModel user) async {
    return _databaseHelper.register(user);
  }

  //Obtenemos todos los usuarios desde el SQLite
  Future<List<UserModel>> getUsers() {
    return _databaseHelper.getUsers();
  }

  Future<int> updateUser(UserModel user) {
    return _databaseHelper.updateUser(user);
  }

  Future<int> deleteUser(int id) {
    return _databaseHelper.deleteUSer(id);
  }
}
