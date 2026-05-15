import 'package:flutter/material.dart';

import 'dart:math';

class Infinita extends StatefulWidget {
  static const String routeName = "/infinita";
  @override
  _InfinitaState createState() => new _InfinitaState();
}

class _InfinitaState extends State<Infinita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista Infinita - APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('product $i'),
            subtitle: Text('Precio: ${Random().nextInt(800)}USD'),
          );
        },
      ),
    );
  }
}
