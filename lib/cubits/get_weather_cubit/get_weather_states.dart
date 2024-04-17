import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFaliureState extends WeatherState {
  final String erroMessage;

  WeatherFaliureState(String string, {required this.erroMessage});
}
