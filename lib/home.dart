import 'package:appmovilejecuciones26_1/widget/cardStateless.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Drawer getDrawer(BuildContext context) {
    var header = DrawerHeader(child: Text('Ajustes'));
    ListTile getItem(Icon icon, String description, String route) {
      return ListTile(
        leading: icon,
        title: Text(description),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      );
    }

    ListView getList() {
      return ListView(
        children: <Widget>[
          header,
          getItem(Icon(Icons.card_giftcard), 'card', '/cardStateless'),
          getItem(Icon(Icons.home), 'Pagina Principal', '/'),
          getItem(Icon(Icons.tab_sharp), 'Tabs', '/tabsStateful'),
          getItem(Icon(Icons.radio_button_off), 'button', '/button'),
          getItem(Icon(Icons.text_fields), 'TextField', "/textField"),
          getItem(Icon(Icons.diamond_outlined), 'Dialog', "/dialog"),
          getItem(Icon(Icons.shopping_cart), 'infinita', "/infinita"),
        ],
      );
    }

    return Drawer(child: getList());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pantalla Principal',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: MyCard(),
      drawer: getDrawer(context),
    );
  }
}
