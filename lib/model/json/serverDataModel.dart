class ServerDataModel {
  final num espId;
  final num humidity;
  final List hygrometer;
  final num waterlevel;
  final num pH;
  final DateTime timestamp;

  ServerDataModel(this.espId, this.hygrometer, this.waterlevel, this.pH,
      this.timestamp, this.humidity);

  ServerDataModel.fromJson(Map<String, dynamic> parsedJson)
      : espId = parsedJson['espid'],
        hygrometer = parsedJson['hygrometer'],
        waterlevel = parsedJson['waterlevel'],
        pH = parsedJson['pH'],
        timestamp = DateTime.parse(parsedJson['timestamp']),
        humidity = parsedJson['humidity'];
}
