import 'package:appmovilejecuciones26_1/home.dart';
import 'package:appmovilejecuciones26_1/widget/button.dart';
import 'package:appmovilejecuciones26_1/widget/dialog.dart';
import 'package:appmovilejecuciones26_1/widget/infinita.dart';
import 'package:appmovilejecuciones26_1/widget/tabs.dart';
import 'package:appmovilejecuciones26_1/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:appmovilejecuciones26_1/widget/cardStateless.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      //Mapeo de la ruta :D a utilizar
      routes: <String, WidgetBuilder>{
        MyApp.routerName: (BuildContext context) => MyApp(),
        MyTabs.routerName: (BuildContext context) => MyTabs(),
        MyButton.routeName: (BuildContext context) => MyButton(),
        MyTextField.routeName: (BuildContext context) => MyTextField(),
        MyDialog.routeName: (BuildContext context) => MyDialog(),
        Infinita.routeName: (BuildContext context) => Infinita(),
      },
    ),
  );
}
