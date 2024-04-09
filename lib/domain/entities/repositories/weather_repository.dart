import 'package:http/http.dart' as http;
import 'dart:convert';

import './../../../data/models/historical_weather.dart';

class WeatherRepository {
  final String baseUrl =
      "https://history.openweathermap.org/data/2.5/history/city";

  Future<List<Weather>> fetchWeather(
      double lat, double lon, int start, int end, String apiKey) async {
    try {
      print('Calling API');
      final response = await http.get(Uri.parse(
          '$baseUrl?lat=$lat&lon=$lon&type=hour&start=$start&end=$end&appid=$apiKey'));
      print('Response-');
      print(response);
      if (response.statusCode == 200) {
        print('Status code is 200');
        final data = json.decode(response.body);
        final List<dynamic> weathersJson = data['list'];
        return weathersJson.map((json) => Weather.fromJson(json)).toList();
      } else {
        // Here, you can handle different status codes differently if needed
        print('Error - Status code: ${response.statusCode}');
        throw Exception(
            'Failed to load weather data with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Catch and handle exceptions from the HTTP request or JSON processing
      print('An error occurred: $e');
      // Optionally, you can handle the exception by returning an empty list,
      // or re-throwing a custom exception message
      // return <Weather>[];
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
