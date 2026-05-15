import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  static const String routeName = '/textField';
  @override
  _MyTextFieldState createState() => new _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String inputText = "";
  final TextEditingController controller = TextEditingController();

  void onSubmitted(String value) {
    setState(() {
      inputText = inputText + "\n" + value;
      controller.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TextField - App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Ingresar Nombre"),
              onSubmitted: onSubmitted, //Llamamos al evento :D
              controller: controller,
            ),
            Text(inputText),
          ],
        ),
      ),
    );
  }
}
