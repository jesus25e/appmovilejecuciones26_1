import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  static const String routeName = "/dialog";
  @override
  _MyDialogState createState() => new _MyDialogState();
}

enum DialogAction { yes, no }

class _MyDialogState extends State<MyDialog> {
  void alertResult(DialogAction action) {
    print("Tu Selección es $action");
  }

  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text("Alerta"),
      actions: <Widget>[
        ElevatedButton(
          child: Text("Opt-Sí"),
          onPressed: () {
            alertResult(DialogAction.yes);
          },
        ),
        ElevatedButton(
          child: Text("Opt-No"),
          onPressed: () {
            alertResult(DialogAction.no);
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dialog - App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(decoration: InputDecoration(hintText: "Ingrese Texto")),
            ElevatedButton(onPressed: showAlert, child: Text("Ver Alerta")),
          ],
        ),
      ),
    );
  }
}
