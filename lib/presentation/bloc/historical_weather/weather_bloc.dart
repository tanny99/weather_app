import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entities/repositories/weather_repository.dart';
import 'package:weather_app/presentation/bloc/historical_weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/historical_weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await weatherRepository.fetchWeather(
            event.lat, event.lon, event.start, event.end, event.apiKey);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError());
      }
    });
  }
}
