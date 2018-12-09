import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Notification extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _Notification();
    }
}

class _Notification extends State<Notification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project   
     // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon'); 
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        SelectNotification: onSelectNotification);
  }

Future _showNotificationWithoutSound() async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      playSound: false, importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics =
      new IOSNotificationDetails(presentSound: false);
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    'Error',
    'Values not correct',
    platformChannelSpecifics,
    payload: 'No_Sound',
  );
}
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              
              new RaisedButton(
                onPressed: _showNotificationWithoutSound,
                child: new Text('Show Notification Without Sound'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Notification extends StatefulWidget {
//   @override
//     State<StatefulWidget> createState() {
//       return _Notification();
//     }
// }

// class _Notification extends State<Notification> {
//   FlutterLocalNotificationsPlugin notificationsPlugin;

//   @override
//   initState() {
//     super.initState();
//     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project   
//      // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher

//     notificationsPlugin = new FlutterLocalNotificationsPlugin();

//     var android = new AndroidInitializationSettings('mipmap/ic_launcher');
//     var ios = new IOSInitializationSettings();
//     var initSettings = new InitializationSettings(android, ios);
//     notificationsPlugin.initialize(initSettings, SelectNotification: onSelectNotification);
//   }

//   // Method 1
// Future _showNotificationWithSound() async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       sound: 'slow_spring_board',
//       importance: Importance.Max,
//       priority: Priority.High);
//   var iOSPlatformChannelSpecifics =
//       new IOSNotificationDetails(sound: "slow_spring_board.aiff");
//   var platformChannelSpecifics = new NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await notificationsPlugin.show(
//     0,
//     'New Post',
//     'How to Show Notification in Flutter',
//     platformChannelSpecifics,
//     payload: 'Custom_Sound',
//   );
// }
// // Method 2
// Future _showNotificationWithDefaultSound() async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       importance: Importance.Max, priority: Priority.High);
//   var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//   var platformChannelSpecifics = new NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await notificationsPlugin.show(
//     0,
//     'New Post',
//     'How to Show Notification in Flutter',
//     platformChannelSpecifics,
//     payload: 'Default_Sound',
//   );
// }
// // Method 3
// Future _showNotificationWithoutSound() async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       playSound: false, importance: Importance.Max, priority: Priority.High);
//   var iOSPlatformChannelSpecifics =
//       new IOSNotificationDetails(presentSound: false);
//   var platformChannelSpecifics = new NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await notificationsPlugin.show(
//     0,
//     'New Post',
//     'How to Show Notification in Flutter',
//     platformChannelSpecifics,
//     payload: 'No_Sound',
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Plugin example app'),
//         ),
//         body: new Center(
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               new RaisedButton(
//                 onPressed: _showNotificationWithSound,
//                 child: new Text('Show Notification With Sound'),
//               ),
//               new SizedBox(
//                 height: 30.0,
//               ),
//               new RaisedButton(
//                 onPressed: _showNotificationWithoutSound,
//                 child: new Text('Show Notification Without Sound'),
//               ),
//               new SizedBox(
//                 height: 30.0,
//               ),
//               new RaisedButton(
//                 onPressed: _showNotificationWithDefaultSound,
//                 child: new Text('Show Notification With Default Sound'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future onSelectNotification(String payload) async {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return new AlertDialog(
//           title: Text("PayLoad"),
//           content: Text("Payload : $payload"),
//         );
//       },
//     );
//   }
// }