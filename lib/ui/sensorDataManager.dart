import 'package:flutter/material.dart';

import '../common/apifunctions/requestServerDataAPI.dart';

import '../model/json/serverDataModel.dart';
import './sensorDataList.dart';

class SensorDataManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DataManagerState();
  }
}

class _DataManagerState extends State<SensorDataManager> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FutureBuilder<List<ServerDataModel>>(
          future: requestServerDataAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (!snapshot.hasData) return CircularProgressIndicator();
            print(snapshot.data);
            return SensorDataList(data: snapshot.data);
          },
        ),
      ),
    );
  }
}
