import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../common/platform/platformScaffold.dart';
import '../common/widgets/basicDrawer.dart';
import './sensorDataManager.dart';
import '../common/apifunctions/requestMQTT.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/HomeScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreenAccent,
                  ),
                ),
                Text("User"),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text('Map'),
            onTap: () {
              Navigator.pushNamed(context, '/Map');
            },
          ),
          ListTile(
            title: Text('Graphs'),
            onTap: () {
              Navigator.pushNamed(context, '/GraphScreen');
              connectToMQTT();
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/Settings');
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/AboutScreen');
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/LoginScreen');
            },
          ),
        ]),
      ),
      appBar: AppBar(title: Text('Hydroponic System')),
      body: SensorDataManager(),
    );
  }
}
