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
}
