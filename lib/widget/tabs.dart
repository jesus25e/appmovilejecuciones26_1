import 'package:appmovilejecuciones26_1/screens/contact.dart';
import 'package:appmovilejecuciones26_1/screens/home.dart';
import 'package:appmovilejecuciones26_1/screens/video.dart';
import 'package:flutter/material.dart';

class MyTabs extends StatefulWidget {
  static const String routerName = "/tabsStateful";
  @override
  _MyTabsState createState() => new _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Video Tabs',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.redAccent,
          shadowColor: Colors.grey,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.yellow,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.ondemand_video)),
              Tab(icon: Icon(Icons.contacts)),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[Home(), Video(), Contact()]),
      ),
    );
  }
}
