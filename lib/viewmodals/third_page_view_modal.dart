import 'package:flutter/material.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/services/weather_services.dart';

class ThirdPageViewModal extends ChangeNotifier {
  WeatherServices weatherServices =
      WeatherServices();
  CurrentWeatherModel? currentWeatherModel;
  DailyWeatherModel? dailyWeatherModel = DailyWeatherModel();

  Future<void> getDailyWeather(double latitude, double longitude) async {
    dailyWeatherModel =
        await weatherServices.getDailyWeather(latitude, longitude);
    notifyListeners();
  }
    Future<void> getCurrentWeather(double latitude, double longitude) async {
    currentWeatherModel =
        await weatherServices.getCurrentWeather(latitude, longitude);
    notifyListeners();
  }
}
