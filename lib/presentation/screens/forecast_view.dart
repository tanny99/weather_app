import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/common/api_constant.dart';

import '../../common/forecast_weather_data.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key});

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  final WeatherFactory _weatherFactory = WeatherFactory(open_weather_api_key);

  late List<Weather?> _weather;
  @override
  void initState() {
    super.initState();
    _determinePosition().then((Position position) {
      _weatherFactory
          .fiveDayForecastByLocation(position.latitude, position.longitude)
          .then((value) {
        setState(() {
          _weather = value;
        });
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

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
        title: const Text('5-Day Weather Forecast'),
      ),
      body: (_weather == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _weather.length,
              itemBuilder: (context, index) {
                final weather = _weather[index];
                return ListTile(
                  leading: Container(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    child: Image(
                      image: NetworkImage(
                          'https://openweathermap.org/img/wn/${weather?.weatherIcon}@4x.png'),
                    ),
                  ),
                  title: Text(weather?.date != null
                      ? DateFormat('EEEE, MMMm d').format(weather!.date!)
                      : 'Date not available'),
                  subtitle: Row(
                    children: [
                      Text(weather?.weatherDescription ??
                          'Description not available'),
                      Text(weather!.areaName ?? 'not available'),
                    ],
                  ),
                  trailing: Text(
                      '${weather?.tempMin ?? 'Not available.'} - ${weather?.tempMax ?? 'Not available.'}'),
                );
              },
            ),
    );
  }
}
