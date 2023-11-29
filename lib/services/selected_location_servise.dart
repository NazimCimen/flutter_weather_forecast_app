import 'package:dio/dio.dart';
import 'package:theweather/models/selected_location_model.dart';

class SelectedLocationService {
  Dio _networkManager = Dio();
  List<SelectedLocationModel> items = [];
  Future<List<SelectedLocationModel>?> getNameOfSelectedLocation(
      String query) async {
    if (query.isNotEmpty) {
      final response = await _networkManager.get(
          'http://api.openweathermap.org/geo/1.0/direct?q=$query&limit=10&appid=dbe3c1968b77993b8dab67c0579c8906');
      if (response.statusCode == 200) {
        //veriler geldi..
        final datas = response.data;
        if (datas is List) {
          items = datas.map((e) => SelectedLocationModel.fromJson(e)).toList();
          return items;
        }
      }
    }
    return null;
  }

}
