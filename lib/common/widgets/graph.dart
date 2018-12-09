// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// // connecToMQTT();

// class GraphScreen extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   GraphScreen(this.seriesList, {this.animate});

//   /// Creates a [TimeSeriesChart] with sample data and no transition.
//   factory GraphScreen.withSampleData() {
//     return new GraphScreen(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new charts.TimeSeriesChart(
//       seriesList,
//       animate: animate,
//       // Optionally pass in a [DateTimeFactory] used by the chart. The factory
//       // should create the same type of [DateTime] as the data provided. If none
//       // specified, the default creates local date time.
//       dateTimeFactory: const charts.LocalDateTimeFactory(),
//     );
//   }

//   static waterLevelGraph(dynamic sensorValue) {
//     print("REVEIVING IN CHARTS SCREEN");
//     print(sensorValue["waterlevel"]);
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<TimeSeriesData, DateTime>> _createSampleData() {
//     final data = [
//       new TimeSeriesData(new DateTime(2017, 9, 19), 5),
//       new TimeSeriesData(new DateTime(2017, 9, 26), 25),
//       new TimeSeriesData(new DateTime(2017, 10, 3), 100),
//       new TimeSeriesData(new DateTime(2017, 10, 10), 75),
//     ];

//     return [
//       new charts.Series<TimeSeriesData, DateTime>(
//         id: 'WaterLevel',
//         colorFn: (Null, _) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (TimeSeriesData sdata, _) => sdata.time,
//         measureFn: (TimeSeriesData sdata, _) => sdata.data,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample time series data type.
// class TimeSeriesData {
//   final DateTime time;
//   final int data;

//   TimeSeriesData(this.time, this.data);
// }