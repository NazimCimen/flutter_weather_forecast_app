class DailyWeatherModel {
  String? cityName;
  String? countryCode;
  List<Data>? data;
  double? lat;
  double? lon;
  String? stateCode;
  String? timezone;

  DailyWeatherModel(
      {this.cityName,
      this.countryCode,
      this.data,
      this.lat,
      this.lon,
      this.stateCode,
      this.timezone});

  DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
    countryCode = json['country_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    lat = json['lat'];
    lon = json['lon'];
    stateCode = json['state_code'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_name'] = this.cityName;
    data['country_code'] = this.countryCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['state_code'] = this.stateCode;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Data {
  double? appMaxTemp;
  int? appMinTemp;
  int? clouds;
  String? datetime;
  double? highTemp;
  double? lowTemp;
  double? maxTemp;
  double? minTemp;
  double? pres;
  double? temp;
  String? validDate;
  Weather? weather;
  String? windCdir;
  String? windCdirFull;
  int? windDir;
  double? windGustSpd;
  double? windSpd;
  int? rh;
  Data(
      {this.appMaxTemp,
      this.appMinTemp,
      this.clouds,
      this.datetime,
      this.highTemp,
      this.lowTemp,
      this.maxTemp,
      this.minTemp,
      this.pres,
      this.temp,
      this.validDate,
      this.weather,
      this.windCdir,
      this.windCdirFull,
      this.windDir,
      this.windGustSpd,
      this.windSpd,
      this.rh});

  Data.fromJson(Map<String, dynamic> json) {
    appMaxTemp = json['app_max_temp'].toDouble();
    appMinTemp = json['app_min_temp'].toInt();
    clouds = json['clouds'];
    datetime = json['datetime'];
    highTemp = json['high_temp'].toDouble();
    lowTemp = json['low_temp'].toDouble();
    maxTemp = json['max_temp'].toDouble();
    minTemp = json['min_temp'].toDouble();
    pres = json['pres'].toDouble();
    temp = json['temp'].toDouble();
    validDate = json['valid_date'];
    weather =
        json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    windCdir = json['wind_cdir'];
    windCdirFull = json['wind_cdir_full'];
    windDir = json['wind_dir'];
    windGustSpd = json['wind_gust_spd'].toDouble();
    windSpd = json['wind_spd'].toDouble();
     rh = json['rh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_max_temp'] = this.appMaxTemp;
    data['app_min_temp'] = this.appMinTemp;
    data['clouds'] = this.clouds;
    data['datetime'] = this.datetime;
    data['high_temp'] = this.highTemp;
    data['low_temp'] = this.lowTemp;
    data['max_temp'] = this.maxTemp;
    data['min_temp'] = this.minTemp;
    data['pres'] = this.pres;
    data['temp'] = this.temp;
    data['valid_date'] = this.validDate;
    if (this.weather != null) {
      data['weather'] = this.weather!.toJson();
    }
    data['wind_cdir'] = this.windCdir;
    data['wind_cdir_full'] = this.windCdirFull;
    data['wind_dir'] = this.windDir;
    data['wind_gust_spd'] = this.windGustSpd;
    data['wind_spd'] = this.windSpd;
    return data;
  }
}

class Weather {
  String? description;
  int? code;
  String? icon;

  Weather({this.description, this.code, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    code = json['code'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['code'] = this.code;
    data['icon'] = this.icon;
    return data;
  }
}
