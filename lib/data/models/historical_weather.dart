import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double temp;
  final int humidity;
  final double windSpeed;

  const Weather(
      {required this.temp, required this.humidity, required this.windSpeed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
    );
  }

  @override
  List<Object> get props => [temp, humidity, windSpeed];
}
