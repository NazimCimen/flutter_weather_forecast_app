import 'package:flutter/widgets.dart';
import 'package:theweather/consts/boxes.dart';
import 'package:theweather/functions/functions.dart';
import 'package:theweather/hive_database/locations.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/selected_location_model.dart';
import 'package:theweather/services/weather_services.dart';
import 'package:theweather/services/selected_location_servise.dart';

class SecondPageViewModal extends ChangeNotifier {
  String input = '';
  SelectedLocationService _selectedLocationService = SelectedLocationService();
  List<SelectedLocationModel>? items = [];

  List<CurrentWeatherModel> weatherModelList = [];
  WeatherServices weatherService = WeatherServices();
  CurrentWeatherModel? currentWeatherModel2 = CurrentWeatherModel();

  Future<void> fetchList(String query) async {
    items = await _selectedLocationService.getNameOfSelectedLocation(query);
    notifyListeners();
  }

//bu fonksiyona veriler null! geliyor null gelme durumunu kontrol et
  Future<void> getCurrentWeather(double latitude, double longitude) async {
    currentWeatherModel2 =
        await weatherService.getCurrentWeather(latitude, longitude);
    weatherModelList.add(currentWeatherModel2!);
    //id ve weather model eklemeden null kontrolu yap
    String uniqueID = generateUniqueID();
    boxLocations.put(
        uniqueID,
        Locations(
            lat: currentWeatherModel2!.data![0].lat!,
            lon: currentWeatherModel2!.data![0].lon!));
    notifyListeners();
  }

  Future<void> getRequestFromSavedLocations() async {
    List<Locations> locationsDatas =
        boxLocations.values.toList().cast<Locations>();
    if (locationsDatas.isNotEmpty) {
      for (int i = 0; i < locationsDatas.length; i++) {
        if (locationsDatas[i].lat != null && locationsDatas[i].lon != null) {
          currentWeatherModel2 = await weatherService.getCurrentWeather(
              locationsDatas[i].lat, locationsDatas[i].lon);
          weatherModelList.add(currentWeatherModel2!);
        }
        notifyListeners();
      }
    }
  }

  deleteLocationContainer(int index) async {
    print(
        '--------------------------****-------------------${boxLocations.length}');

    ///id olmadığı için böyle yaptım
    weatherModelList.removeAt(index);
    boxLocations.clear();
    for (int i = 0; i < weatherModelList.length; i++) {
      String uniqueID = generateUniqueID();
      boxLocations.put(
          uniqueID,
          Locations(
              lat: weatherModelList[i].data![0].lat!,
              lon: weatherModelList[i].data![0].lon!));
    }
    print(
        '--------------------------****-------------------${boxLocations.length}');
    notifyListeners();
  }
}
