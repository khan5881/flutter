import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../model/json/serverDataModel.dart';

class SensorDataList extends StatelessWidget {
  final List<ServerDataModel> data;

  SensorDataList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Time - ${data[position].timestamp}",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                "Box - ${[position]}",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text("espid - ${data[position].espId}"),
              (data[position].humidity >= 40 || data[position].humidity <= 60.0)
                  ? Text("humidity Level - ${data[position].humidity}")
                  : Text(
                      "humidity Level - ${data[position].humidity}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
              (data[position].pH >= 5.5 || data[position].pH <= 7.0)
                  ? Text("pH Level - ${data[position].pH}")
                  : Text(
                      "pH Level - ${data[position].pH}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
              (data[position].waterlevel >= 15.0 ||
                      data[position].waterlevel <= 25.0)
                  ? Text("waterlevel Level - ${data[position].waterlevel}")
                  : Text(
                      "waterlevel Level - ${data[position].waterlevel}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
              (data[position].hygrometer[0] >= 40.0 ||
                      data[position].hygrometer[0] <= 60.0)
                  ? Text(
                      "hygrometer[0] Level - ${data[position].hygrometer[0]}")
                  : Text(
                      "hygrometer[0] Level - ${data[position].hygrometer[0]}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
              (data[position].hygrometer[1] >= 40.0 ||
                      data[position].hygrometer[1] <= 60.0)
                  ? Text(
                      "hygrometer[1] Level - ${data[position].hygrometer[1]}")
                  : Text(
                      "hygrometer[1] Level - ${data[position].hygrometer[1]}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
              (data[position].hygrometer[2] >= 40.0 ||
                      data[position].hygrometer[2] <= 60.0)
                  ? Text(
                      "hygrometer[2] Level - ${data[position].hygrometer[2]}")
                  : Text(
                      "hygrometer[2] Level - ${data[position].hygrometer[2]}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
              (data[position].hygrometer[3] >= 40.0 ||
                      data[position].hygrometer[3] <= 60.0)
                  ? Text(
                      "hygrometer[3] Level - ${data[position].hygrometer[3]}")
                  : Text(
                      "hygrometer[3] Level - ${data[position].hygrometer[3]}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
            ],
          );
        },
      ),
    );
  }
}
