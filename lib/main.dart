import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/historical_weather/weather_bloc.dart';
import 'package:weather_app/presentation/screens/forecast_view.dart';
import 'domain/entities/repositories/weather_repository.dart';
import 'presentation/screens/map_view.dart';
import 'presentation/screens/historical_view.dart'; // Make sure to create this file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository = WeatherRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository),
        child: WeatherApp(),
      ),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ForecastView(), // Placeholder for Forecast View
    HistoricalView(),
    MapView(), // Placeholder for Map View
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Forecast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historical',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
