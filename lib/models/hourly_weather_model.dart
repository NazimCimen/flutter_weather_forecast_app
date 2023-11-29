class HourlyWeatherModel {
  String? cityName;
  String? countryCode;
  List<Data>? data;
  double? lat;
  double? lon;
  String? stateCode;
  String? timezone;

  HourlyWeatherModel(
      {this.cityName,
      this.countryCode,
      this.data,
      this.lat,
      this.lon,
      this.stateCode,
      this.timezone});

  HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
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
  double? appTemp;
  int? cloudsHi;
  int? cloudsLow;
  int? cloudsMid;
  String? datetime;
  int? pres;
  double? temp;
  String? timestampLocal;
  Weather? weather;
  String? windCdir;
  String? windCdirFull;
  int? windDir;
  double? windGustSpd;
  double? windSpd;

  Data(
      {this.appTemp,
      this.cloudsHi,
      this.cloudsLow,
      this.cloudsMid,
      this.datetime,
      this.pres,
      this.temp,
      this.timestampLocal,
      this.weather,
      this.windCdir,
      this.windCdirFull,
      this.windDir,
      this.windGustSpd,
      this.windSpd});

  Data.fromJson(Map<String, dynamic> json) {
    appTemp = json['app_temp'].toDouble();
    cloudsHi = json['clouds_hi'];
    cloudsLow = json['clouds_low'];
    cloudsMid = json['clouds_mid'];
    datetime = json['datetime'];
    pres = json['pres'].toInt();
    temp = json['temp'].toDouble();
    timestampLocal = json['timestamp_local'];
    weather =
        json['weather'] != null ?  Weather.fromJson(json['weather']) : null;
    windCdir = json['wind_cdir'];
    windCdirFull = json['wind_cdir_full'];
    windDir = json['wind_dir'];
    windGustSpd = json['wind_gust_spd'].toDouble();
    windSpd = json['wind_spd'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_temp'] = this.appTemp;
    data['clouds_hi'] = this.cloudsHi;
    data['clouds_low'] = this.cloudsLow;
    data['clouds_mid'] = this.cloudsMid;
    data['datetime'] = this.datetime;
    data['pres'] = this.pres;
    data['temp'] = this.temp;
    data['timestamp_local'] = this.timestampLocal;
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
  String? icon;
  String? description;
  int? code;

  Weather({this.icon, this.description, this.code});

  Weather.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    description = json['description'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['description'] = this.description;
    data['code'] = this.code;
    return data;
  }
}
