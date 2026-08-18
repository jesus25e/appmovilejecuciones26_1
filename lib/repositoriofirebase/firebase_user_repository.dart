import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> guardarUsuario(Map<String, dynamic> usuario) async {
    if (usuario['id'] == null) {
      throw Exception("El usuario no tiene campo id");
    }
    final String docId = usuario['id'].toString();
    await _firestore.collection('users').doc(docId).set({
      ...usuario,
      'registro': DateTime.now().toIso8601String(),
    }, SetOptions(merge: true));
  }
}
