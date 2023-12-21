import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/services/location_permission_servise.dart';
import 'package:theweather/services/weather_services.dart';
import 'package:theweather/ui_template.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

late LocationPermissionService _locationService;
late final WeatherServices _currentWeatherService;
late CurrentWeatherModel? _currentWeatherModel;
late DailyWeatherModel? _dailyWeatherModel;

class _LoadingPageState extends State<LoadingPage> {
  void anasayfayagec(CurrentWeatherModel? currentWeatherModel,
      DailyWeatherModel? _dailyWeatherModel) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return UiTemplate(
          currentWeatherModel: currentWeatherModel,
          dailyWeatherModel: _dailyWeatherModel,
        );
      }),
    );
  }

  Future<void> getLocationAndPrepareDatas() async {
    await _locationService.getCurrentLocation();
    if (_locationService.latitude == null &&
        _locationService.longitude == null) {
      print('konum bilgileri gelmiyor');
    } else {
      _currentWeatherModel = (await _currentWeatherService.getCurrentWeather(
          _locationService.latitude, _locationService.longitude));
      _dailyWeatherModel = await _currentWeatherService.getDailyWeather(
          _locationService.latitude, _locationService.longitude);
      print('latitude: ' + _locationService.latitude.toString());
      print('longitude: ' + _locationService.longitude.toString());
      anasayfayagec(_currentWeatherModel, _dailyWeatherModel);
    }
  }

  @override
  void initState() {
    super.initState();
    _locationService = LocationPermissionService();
    _currentWeatherService = WeatherServices();
    _dailyWeatherModel = DailyWeatherModel();
    getLocationAndPrepareDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/weathearforecast.json'),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('L O A D I N G'),
              SizedBox(
                width: 10,
              ),
              SpinKitThreeBounce(
                color: Colors.black,
                size: 10,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
