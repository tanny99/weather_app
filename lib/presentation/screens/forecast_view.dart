import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/forecast_weather_data.dart';

class ForecastView extends StatelessWidget {
  final List<ForecastWeatherData> forecastData = [
    ForecastWeatherData(
        date: DateTime.now().add(Duration(days: 1)),
        minTemperature: 10.0,
        maxTemperature: 20.0,
        description: "Sunny"),
    ForecastWeatherData(
        date: DateTime.now().add(Duration(days: 2)),
        minTemperature: 11.0,
        maxTemperature: 19.0,
        description: "Partly Cloudy"),
    ForecastWeatherData(
        date: DateTime.now().add(Duration(days: 3)),
        minTemperature: 12.0,
        maxTemperature: 18.0,
        description: "Cloudy"),
    ForecastWeatherData(
        date: DateTime.now().add(Duration(days: 4)),
        minTemperature: 9.0,
        maxTemperature: 17.0,
        description: "Rainy"),
    ForecastWeatherData(
        date: DateTime.now().add(Duration(days: 5)),
        minTemperature: 8.0,
        maxTemperature: 16.0,
        description: "Windy"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5-Day Weather Forecast'),
      ),
      body: ListView.builder(
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          final item = forecastData[index];
          return ListTile(
            title: Text(DateFormat('EEEE, MMMM d').format(item.date)),
            subtitle: Text(item.description),
            trailing:
                Text('${item.minTemperature}°C - ${item.maxTemperature}°C'),
          );
        },
      ),
    );
  }
}
