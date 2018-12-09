import 'package:flutter/material.dart';

import './ui/homeScreen.dart';
import './ui/loginScreen.dart';
import './ui/splashScreen.dart';
import './ui/registerScreen.dart';
import './ui/aboutScreen.dart';
import './ui/graphScreen.dart';
import 'package:splash_tokenauth/common/functions/notifications.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  var _splashShown = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Splash and Token Authentication",
      routes: <String, WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => HomeScreen(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
        "/Register": (BuildContext context) => RegisterScreen(),
        "/AboutScreen":(BuildContext context) => AboutScreen(),
        "/GraphScreen":(BuildContext context) => GraphScreen(),
      },
      home: SplashScreen(),
    );
  }
}