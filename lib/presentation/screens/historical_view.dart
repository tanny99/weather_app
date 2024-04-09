import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/historical_weather.dart';
import 'package:weather_app/presentation/bloc/historical_weather/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/historical_weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/historical_weather/weather_state.dart';

class HistoricalView extends StatefulWidget {
  @override
  _HistoricalViewState createState() => _HistoricalViewState();
}

class _HistoricalViewState extends State<HistoricalView> {
  @override
  void initState() {
    super.initState();
    // Example parameters - replace with actual values and possibly user input
    final double lat = 40.7128;
    final double lon = -74.0060;
    final int start =
        DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch ~/
            1000; // 1 day ago
    print('Start and END');
    print(start);
    final int end = DateTime.now().millisecondsSinceEpoch ~/ 1000; // now
    print(end);
    final String apiKey =
        '0da716ee8d196d0976801cec25a26480'; // Use your real API key here

    BlocProvider.of<WeatherBloc>(context)
        .add(FetchWeather(lat, lon, start, end, apiKey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historical Weather Data'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return ListView.builder(
              itemCount: state.weather.length,
              itemBuilder: (context, index) {
                final Weather weather = state.weather[index];
                return ListTile(
                  title: Text('Temperature: ${weather.temp.toString()}°'),
                  subtitle: Text(
                      'Humidity: ${weather.humidity}%\nWind Speed: ${weather.windSpeed} m/s'),
                );
              },
            );
          } else if (state is WeatherError) {
            return Center(child: Text('Failed to fetch weather data'));
          } else {
            return Center(
                child: Text('Enter details to fetch historical weather data'));
          }
        },
      ),
    );
  }
}
