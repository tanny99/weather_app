import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/main.dart';
import '../../logger.dart';
import 'route_arguments.dart';
import 'routes.dart';

const String _h = 'route_generator';

@lazySingleton
class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    logDebugFine(_h, 'Route: ${settings.name}');
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => WeatherApp());

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
