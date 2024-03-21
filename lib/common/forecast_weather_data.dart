class ForecastWeatherData {
  final DateTime date;
  final double minTemperature;
  final double maxTemperature;
  final String description;

  ForecastWeatherData({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.description,
  });
}
