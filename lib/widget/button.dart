import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  static const String routeName = '/button';
  @override
  _MyButtonState createState() => new _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String flutterText = "";
  int indice = 0;

  List<String> collections = ['Juan', 'Jessica', 'Jorge', 'Pedro'];
  void onPressButton() {
    setState(() {
      flutterText = collections[indice];
      indice = indice < 3 ? indice + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mi Button APP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(flutterText, style: TextStyle(fontSize: 40.0)),
              Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                child: Text('Actualizar App'),
                style: ElevatedButton.styleFrom(
                  //primary: Colors.green,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onPressed: onPressButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
