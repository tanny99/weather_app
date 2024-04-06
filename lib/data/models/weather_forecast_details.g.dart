// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temp _$TempFromJson(Map<String, dynamic> json) => Temp(
      day: (json['day'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      night: (json['night'] as num).toDouble(),
      eve: (json['eve'] as num).toDouble(),
      morn: (json['morn'] as num).toDouble(),
    );

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

Alerts _$AlertsFromJson(Map<String, dynamic> json) => Alerts(
      senderName: json['senderName'] as String,
      event: json['event'] as String,
      start: json['start'] as int,
      end: json['end'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$AlertsToJson(Alerts instance) => <String, dynamic>{
      'senderName': instance.senderName,
      'event': instance.event,
      'start': instance.start,
      'end': instance.end,
      'description': instance.description,
    };

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) => FeelsLike(
      day: (json['day'] as num).toDouble(),
      night: (json['night'] as num).toDouble(),
      eve: (json['eve'] as num).toDouble(),
      morn: (json['morn'] as num).toDouble(),
    );

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

WeatherForecastDetails _$WeatherForecastDetailsFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastDetails(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      timezone: json['timezone'] as String,
      timezoneOffset: json['timezoneOffset'] as int,
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      minutely: (json['minutely'] as List<dynamic>)
          .map((e) => Minutely.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => Hourly.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
      alerts: (json['alerts'] as List<dynamic>)
          .map((e) => Alerts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherForecastDetailsToJson(
        WeatherForecastDetails instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezoneOffset': instance.timezoneOffset,
      'current': instance.current,
      'minutely': instance.minutely,
      'hourly': instance.hourly,
      'daily': instance.daily,
      'alerts': instance.alerts,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dewPoint'] as num).toDouble(),
      uvi: (json['uvi'] as num).toDouble(),
      clouds: json['clouds'] as int,
      visibility: json['visibility'] as int,
      windSpeed: (json['windSpeed'] as num).toDouble(),
      windDeg: json['windDeg'] as int,
      windGust: (json['windGust'] as num).toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dewPoint': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'windGust': instance.windGust,
      'weather': instance.weather,
    };

Minutely _$MinutelyFromJson(Map<String, dynamic> json) => Minutely(
      dt: json['dt'] as int,
      precipitation: (json['precipitation'] as num).toDouble(),
    );

Map<String, dynamic> _$MinutelyToJson(Minutely instance) => <String, dynamic>{
      'dt': instance.dt,
      'precipitation': instance.precipitation,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      dt: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
    };

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      moonrise: json['moonrise'] as int,
      moonset: json['moonset'] as int,
      moonPhase: (json['moonPhase'] as num).toDouble(),
      temp: Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: FeelsLike.fromJson(json['feelsLike'] as Map<String, dynamic>),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dewPoint: (json['dewPoint'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      windDeg: json['windDeg'] as int,
      windGust: (json['windGust'] as num).toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] as int,
      pop: (json['pop'] as num).toDouble(),
      rain: (json['rain'] as num).toDouble(),
      uvi: (json['uvi'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moonPhase': instance.moonPhase,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dewPoint': instance.dewPoint,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'windGust': instance.windGust,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
      'uvi': instance.uvi,
    };
