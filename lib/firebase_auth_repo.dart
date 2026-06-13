import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  //Instancia privada de FirebaseAuth para interactuar con el backend
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Metodo para iniciar sesion con correo y contraseña :D
  Future<User?> signIn(String email, String password) async {
    //Usa Firebase para autenticar el usuario con email y password
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    //Retorna el usuario autenticado y la operacion fue exitosa ;D
    return cred.user;
  }

  Future<User?> register(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  //Metodo para cerrar la sesion del usuario actual
  Future<void> signOut() async => _auth.signOut();

  //Emite el estado del usuario autenticado
  Stream<User?> get userStream => _auth.authStateChanges();
}
