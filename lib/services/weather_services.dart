import 'package:dio/dio.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/models/hourly_weather_model.dart';

class WeatherServices {
  Dio _networkmanager = Dio();
  CurrentWeatherModel currentWeatherModel = CurrentWeatherModel();

  Future<CurrentWeatherModel?> getCurrentWeather(
      double? latitude, double? longitude) async {
    final response = await _networkmanager.get(
        'https://api.weatherbit.io/v2.0/current?lat=$latitude&lon=$longitude&key=c64c0ff3b6734bd9bb0044dfccd2ac21');
    if (response.statusCode == 200) {
      if (response.data is Map) {
        currentWeatherModel = CurrentWeatherModel.fromJson(response.data);
        return currentWeatherModel;
      }
    }
  }

  DailyWeatherModel dailyWeatherItems = DailyWeatherModel();

  Future<DailyWeatherModel?> getDailyWeather(
      double? latitude, double? longitude) async {
    final response = await _networkmanager.get(
        'https://api.weatherbit.io/v2.0/forecast/daily?lat=$latitude&lon=$longitude&key=c64c0ff3b6734bd9bb0044dfccd2ac21');
    if (response.statusCode == 200) {
      if (response.data is Map) {
        dailyWeatherItems = DailyWeatherModel.fromJson(response.data);
        return dailyWeatherItems;
      } else {
        print('hata var');
      }
    } else {
      print('hata var');
    }
  }

  HourlyWeatherModel hourlyWeatherItems = HourlyWeatherModel();
  Future<HourlyWeatherModel?> getHourlyWeather(
      double? latitude, double? longitude) async {
    final response = await _networkmanager.get(
        'https://api.weatherbit.io/v2.0/forecast/hourly?lat=$latitude&lon=$longitude&key=c64c0ff3b6734bd9bb0044dfccd2ac21&hours=200');
    if (response.statusCode == 200) {
      if (response.data is Map) {
        hourlyWeatherItems = HourlyWeatherModel.fromJson(response.data);
        return hourlyWeatherItems;
      } else {
        print('hata var');
      }
    } else {
      print('hata var');
    }
  }
}
