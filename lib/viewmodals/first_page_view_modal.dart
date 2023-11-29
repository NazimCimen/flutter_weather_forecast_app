import 'package:flutter/material.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/models/hourly_weather_model.dart';
import 'package:theweather/services/weather_services.dart';


class FirstPageViewModal extends ChangeNotifier {
  HourlyWeatherModel? hourlyWeatherModel = HourlyWeatherModel();
  CurrentWeatherModel? currentWeatherModel = CurrentWeatherModel();
  DailyWeatherModel? dailyWeatherModel = DailyWeatherModel();
  WeatherServices weatherService = WeatherServices();

  Future<void> getHourlyWeather(double? latitude, double? longitude) async {
    hourlyWeatherModel =
        await weatherService.getHourlyWeather(latitude, longitude);
    // List<Data> datas= hourlyWeatherModel?.data?[0];
    notifyListeners();
  }

    Future<void> getCurrentWeather(double? latitude, double? longitude) async {
    currentWeatherModel =
        await weatherService.getCurrentWeather(latitude, longitude);
    // List<Data> datas= hourlyWeatherModel?.data?[0];
    notifyListeners();
  }

    Future<void> getDailyWeather(double? latitude, double? longitude) async {
    dailyWeatherModel =
        await weatherService.getDailyWeather(latitude, longitude);
    // List<Data> datas= hourlyWeatherModel?.data?[0];
    notifyListeners();
  }
}
