import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp())); // Pasamos nuestro widget
}

class MyApp extends StatelessWidget {
  static const String routerName = "/cardStateless";
  final double iconSize = 40.0;
  final TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Widget Card',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyCard(
              title: Text('CALL FIREFIGHTER', style: textStyle),
              icon: Icon(
                Icons.phone,
                color: Colors.greenAccent,
                size: iconSize,
              ),
            ),
            MyCard(
              title: Text('Archivo', style: textStyle),
              icon: Icon(
                Icons.attach_file,
                color: Colors.lightBlueAccent,
                size: iconSize,
              ),
            ),
            MyCard(
              title: Text('Descargar', style: textStyle),
              icon: Icon(
                Icons.archive,
                color: Colors.redAccent,
                size: iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget? title;
  final Widget? icon;
  MyCard({this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[?this.title, ?this.icon]),
      ),
    );
  }
}
