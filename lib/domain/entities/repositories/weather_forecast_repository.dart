import 'package:dartz/dartz.dart';
import 'package:weather_app/data/models/weather_forecast_details.dart';
import 'package:weather_app/domain/entities/app_error.dart';

abstract class WeatherForecastRepository {
  Future<Either<AppError, WeatherForecastDetails>> getUserAccountDetails(
    Map<String, dynamic> params,
  );
}
