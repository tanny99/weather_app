import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  // Change the declaration of _weather to initialize it as an empty list.
  List<Weather?> _weather = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5-Day Weather Forecast'),
      ),
      body: (_weather == null)
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SizedBox.expand(
                  child: Opacity(
                    opacity: 0.5,
                    child: Image(
                      image: AssetImage('assets/images/weather_wallpaper.jpg'),
                      fit: BoxFit
                          .cover, // This will cover the whole screen, possibly cropping the image.
                    ),
                  ),
                ),
                ListView.builder(
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
                      subtitle: Text(
                        weather?.weatherDescription ??
                            'Description not available',
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Text(
                          '${weather!.tempMin?.celsius?.toStringAsFixed(0) ?? 'Not available.'}°C - ${weather?.tempMax?.celsius?.toStringAsFixed(0) ?? 'Not available.'}°C'),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
