class CurrentWeatherModel {
  int? count;
  List<Data>? data;

  CurrentWeatherModel({this.count, this.data});

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  double? appTemp;
  String? cityName;
  int? clouds;
  String? countryCode;
  String? datetime;
  String? obTime;
  String? stateCode;
  String? station;
  String? sunrise;
  String? sunset;
  double? temp;
  String? timezone;
  Weather? weather;
  String? windCdir;
  String? windCdirFull;
  int? windDir;
  double? windSpd;
  double? lat;
  double? lon;
  int? rh;

  Data({
    this.appTemp,
    this.cityName,
    this.clouds,
    this.countryCode,
    this.datetime,
    this.obTime,
    this.stateCode,
    this.station,
    this.sunrise,
    this.sunset,
    this.temp,
    this.timezone,
    this.weather,
    this.windCdir,
    this.windCdirFull,
    this.windDir,
    this.windSpd,
    this.lat,
    this.lon,
    this.rh
  });

  Data.fromJson(Map<String, dynamic> json) {
    appTemp = json['app_temp'].toDouble();
    cityName = json['city_name'];
    clouds = json['clouds'];
    countryCode = json['country_code'];
    datetime = json['datetime'];
    obTime = json['ob_time'];
    stateCode = json['state_code'];
    station = json['station'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'].toDouble();
    timezone = json['timezone'];
    weather =
        json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    windCdir = json['wind_cdir'];
    windCdirFull = json['wind_cdir_full'];
    windDir = json['wind_dir'];
    windSpd = json['wind_spd'].toDouble();
    lat = json['lat'];
    lon = json['lon'];
    rh = json['rh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_temp'] = this.appTemp;
    data['city_name'] = this.cityName;
    data['clouds'] = this.clouds;
    data['country_code'] = this.countryCode;
    data['datetime'] = this.datetime;
    data['ob_time'] = this.obTime;
    data['state_code'] = this.stateCode;
    data['station'] = this.station;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['temp'] = this.temp;
    data['timezone'] = this.timezone;
    if (this.weather != null) {
      data['weather'] = this.weather!.toJson();
    }
    data['wind_cdir'] = this.windCdir;
    data['wind_cdir_full'] = this.windCdirFull;
    data['wind_dir'] = this.windDir;
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
