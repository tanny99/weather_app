import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {}

class FetchWeather extends WeatherEvent {
  final double lat;
  final double lon;
  final int start;
  final int end;
  final String apiKey;

  FetchWeather(this.lat, this.lon, this.start, this.end, this.apiKey);

  @override
  List<Object> get props => [lat, lon, start, end, apiKey];
}
