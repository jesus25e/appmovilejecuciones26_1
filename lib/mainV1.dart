import 'package:flutter/material.dart';

void main() {
  var primeapp = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mi primer App Movil",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
      ),
      body: Container(
        child: Center(
          child: Text("Bienvenidos", style: TextStyle(fontSize: 40)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('click');
        },
      ),
    ),
  );
  runApp(primeapp);
}
