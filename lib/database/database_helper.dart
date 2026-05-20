//Importamos herramientas para mejorar rutas
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';

//Creamos clase que maneja SQLite
class DatabaseHelper {
  static final DatabaseHelper instace = DatabaseHelper._internal();

  //Creamos un constructor
  DatabaseHelper._internal();

  //Creamos una variable de Base de Datos
  static Database? _database;

  //Obtenemos la base de datos
  Future<Database> get database async {
    // Si ya existe la retorna
    if (_database != null) return _database!;
    //Si no existe, la crea
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Ruta de SQLite
    final dbPath = await getDatabasesPath();
    //exten .db
    final path = join(dbPath, 'login_bloc.db');
    // Abriendo o creando la base de datos
    return await openDatabase(
      path,
      // Subimos la DB
      version: 3,
      // Crea la db
      onCreate: _onCreate,
      // Actualiza db
      onUpgrade: _onUpgrade,
    );
  }

  // Creamos la tablas
  Future<void> _onCreate(Database db, int version) async {
    //Crea tabla users
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombres TEXT NOT NULL,
        apellidos TEXT NOT NULL,
        dni TEXT NOT NULL UNIQUE,
        sexo TEXT NOT NULL,
        registro TEXT NOT NULL,
        direccion TEXT NOT NULL,
        email NOT NULL UNIQUE,
        password TEXT NOT NULL  
      )
''');
    // Creamos un usuario interno para poder ingresar
    await db.insert('users', {
      'nombres': 'Administrador',
      'apellidos': 'Principal',
      'dni': '73194277',
      'sexo': 'Masculino',
      'registro': 'Sistema',
      'direccion': 'av. 12',
      'email': 'admin@gmail.com',
      'password': '123123',
    });
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Elimina la tabla anterior
    await db.execute('DROP TABLE IF EXISTS users');
    // Vuelve a crear la tabla con el admin interno
    await _onCreate(db, newVersion);
  }

  //Registramos usuarios nuevos
  Future<int> register(UserModel user) async {
    final db = await database;
    //insertamos el usuario
    return await db.insert(
      'users',
      user.ToMap(),
      conflictAlgorithm:
          ConflictAlgorithm.abort, // Termine de ralizar el proceso
    );
  }

  Future<UserModel?> login(String email, String password) async {
    // Obtenemos la db
    final db = await database;
    // Buscamos el usuario
    final result = await db.query(
      'users',
      where: 'email=? AND password=?',
      whereArgs: [email, password],
    );

    // Si existe retorna al usuario
    if (result.isNotEmpty) return UserModel.fromMap(result.first);
    //Si no exist user retorna null
    return null;
  }

  Future<List<UserModel>> getUsers() async {
    final db = await database;
    final result = await db.query('users');
    return result.map((map) => UserModel.fromMap(map)).toList();
  }

  Future<int> updateUser(UserModel user) async {
    final db = await database;
    return await db.update(
      'users',
      user.ToMap(),
      where: 'id=?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUSer(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id=?', whereArgs: [id]);
  }
}
