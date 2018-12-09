import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

// connecToMQTT();

class GraphScreen extends StatefulWidget {

@override
  State<StatefulWidget> createState() {
    return _GraphScreen();
  }

   static middleFunc(sensorValue){
    // _GraphScreen.waterLevelGraph(sensorValue);
  }

}

class _GraphScreen extends State<GraphScreen>{
  
  List<charts.Series> seriesList;
  bool animate;
  dynamic sensordata;

  @override
  void initState() {
    super.initState();
    seriesList = initalState();
    animate = false;
  }


  List<charts.Series<TimeSeriesData, DateTime>>initalState(){
 final data = [
      new TimeSeriesData(new DateTime(2017, 9, 19), 0),
    ];


     return [
      new charts.Series<TimeSeriesData, DateTime>(
        id: 'WaterLevel',
        colorFn: (Null, _) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: ( sdata, _) => sdata.time,
        measureFn: (TimeSeriesData sdata, _) => sdata.data,
        data: data,
      )
    ];
  }



  // //  Creates a [TimeSeriesChart] with sample data and no transition.
  // factory _GraphScreen.withSampleData() {
  //   return new _GraphScreen( 
  //     waterLevelGraph("initialState"),
  //     // waterLevelGraph(sensordata),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (this.seriesList.isEmpty) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
    } else {
        return new Container();
    }
  }

  addThisToList(List<charts.Series> tempList){

  }

  /// Create one series with sample hard coded data.
  // static List<charts.Series<TimeSeriesData, DateTime>> _createSampleData() {
  //   final data = [
  //     new TimeSeriesData(new DateTime(2017, 9, 19), 5),
  //     new TimeSeriesData(new DateTime(2017, 9, 26), 25),
  //     new TimeSeriesData(new DateTime(2017, 10, 3), 100),
  //     new TimeSeriesData(new DateTime(2017, 10, 10), 75),
  //   ];

  //   return [
  //     new charts.Series<TimeSeriesData, DateTime>(
  //       id: 'WaterLevel',
  //       colorFn: (Null, _) => charts.MaterialPalette.blue.shadeDefault,
  //       domainFn: ( sdata, _) => sdata.time,
  //       measureFn: (TimeSeriesData sdata, _) => sdata.data,
  //       data: data,
  //     )
  //   ];
  // }
}

/// Sample time series data type.
class TimeSeriesData {
  final DateTime time;
  final int data;

  TimeSeriesData(this.time, this.data);
}