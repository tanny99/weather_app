import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast_details.g.dart';

@JsonSerializable()
class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
  Map<String, dynamic> toJson() => _$TempToJson(this);
}

@JsonSerializable()
class Alerts {
  final String senderName;
  final String event;
  final int start;
  final int end;
  final String description;

  Alerts({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
  });

  factory Alerts.fromJson(Map<String, dynamic> json) => _$AlertsFromJson(json);
  Map<String, dynamic> toJson() => _$AlertsToJson(this);
}

@JsonSerializable()
class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);
  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}

@JsonSerializable()
class WeatherForecastDetails {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Current current;
  final List<Minutely> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;
  final List<Alerts> alerts;
  WeatherForecastDetails({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  factory WeatherForecastDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherForecastDetailsToJson(this);
}

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Current {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;

  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Minutely {
  final int dt;
  final double precipitation;

  Minutely({
    required this.dt,
    required this.precipitation,
  });

  factory Minutely.fromJson(Map<String, dynamic> json) =>
      _$MinutelyFromJson(json);
  Map<String, dynamic> toJson() => _$MinutelyToJson(this);
}

@JsonSerializable()
class Hourly {
  final int dt;
  final double temp;
  final double feelsLike;
  // Add other fields as per the Hourly data structure in your JSON

  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    // Initialize other fields here
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}

@JsonSerializable()
class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather; // Reuse the Weather class defined in Current
  final int clouds;
  final double pop; // Probability of precipitation
  final double rain;
  final double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
