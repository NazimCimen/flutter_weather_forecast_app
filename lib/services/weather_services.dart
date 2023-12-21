import 'package:dio/dio.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/models/hourly_weather_model.dart';
import 'package:theweather/utlity/consts/api_constants.dart';

class WeatherServices {
 final Dio _networkmanager = Dio(BaseOptions(baseUrl:ApiConstants.getBaseUrl()));
  CurrentWeatherModel currentWeatherModel = CurrentWeatherModel();

  Future<CurrentWeatherModel?> getCurrentWeather(
      double? latitude, double? longitude) async {
    final response = await _networkmanager.get(ApiConstants.getCurrentRequest(latitude, longitude)
        );
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
    final response = await _networkmanager.get(ApiConstants.getDailyRequest(latitude, longitude)
       );
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
        ApiConstants.getHourlyRequest(latitude, longitude));
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
