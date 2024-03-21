import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoricalWeatherData {
  final DateTime date;
  final double temperature;
  final String description;

  HistoricalWeatherData(
      {required this.date,
      required this.temperature,
      required this.description});
}

class HistoricalView extends StatelessWidget {
  final List<HistoricalWeatherData> historicalData = [
    HistoricalWeatherData(
        date: DateTime.now().subtract(Duration(days: 1)),
        temperature: 20.0,
        description: "Sunny"),
    HistoricalWeatherData(
        date: DateTime.now().subtract(Duration(days: 2)),
        temperature: 18.5,
        description: "Cloudy"),
    HistoricalWeatherData(
        date: DateTime.now().subtract(Duration(days: 3)),
        temperature: 15.0,
        description: "Rainy"),
    HistoricalWeatherData(
        date: DateTime.now().subtract(Duration(days: 4)),
        temperature: 22.0,
        description: "Sunny"),
    HistoricalWeatherData(
        date: DateTime.now().subtract(Duration(days: 5)),
        temperature: 16.0,
        description: "Windy"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historical Weather Data'),
      ),
      body: ListView.builder(
        itemCount: historicalData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                DateFormat('yyyy-MM-dd').format(historicalData[index].date)),
            subtitle: Text(historicalData[index].description),
            trailing: Text('${historicalData[index].temperature}°C'),
          );
        },
      ),
    );
  }
}
