import 'package:cloud_firestore/cloud_firestore.dart';

class OperacionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> RegistrarOperacion({
    required String idOperacion,
    required String descripcion,
    required int cantidad,
    required double monto,
    required String responsable,
  }) async {
    await _firestore.collection('operaciones').add({
      'idOperacion': idOperacion,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'monto': monto,
      'responsable': responsable,
      'fecha': FieldValue.serverTimestamp(),
    });
  }

  Future<List<Map<String, dynamic>>> obtenerOperaciones() async {
    final snapshot = await _firestore
        .collection('operaciones')
        .orderBy('fecha', descending: true)
        .get();
    // return snapshot.docs.map((doc) {
    //   return {'idDoc': doc.id, ...doc.data()};
    // }).toList();

    //Clase -
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['idDoc'] = doc.id;
      return data;
    }).toList();

    // return snapshot.docs
    //     .map((doc) => doc.data() as Map<String, dynamic>)
    //     .toList();
  }

  Future<void> actualizarOperacion({
    required String idDoc,
    required String idOperacion,
    required String descripcion,
    required int cantidad,
    required double monto,
    required String responsable,
  }) async {
    await _firestore.collection('operaciones').doc(idDoc).update({
      'idOperacion': idOperacion,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'monto': monto,
      'responsable': responsable,
      'fecha': FieldValue.serverTimestamp(),
    });
  }

  Future<void> eliminarOperacion(String idDoc) async {
    await _firestore.collection('operaciones').doc(idDoc).delete();
  }
}
