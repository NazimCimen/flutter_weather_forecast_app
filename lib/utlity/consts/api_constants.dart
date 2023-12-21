class ApiConstants {
  static const String apiKey = 'c64c0ff3b6734bd9bb0044dfccd2ac21';
  static const int hours = 200;
  static String getBaseUrl() {
    return 'https://api.weatherbit.io/v2.0/';
  }

  static String getCurrentRequest(double? latitude, double? longitude) {
    return 'current?lat=$latitude&lon=$longitude&key=$apiKey}';
  }

  static String getHourlyRequest(double? latitude, double? longitude) {
    return 'forecast/hourly?lat=$latitude&lon=$longitude&key=$apiKey}&hours=$hours';
  }

  static String getDailyRequest(double? latitude, double? longitude) {
    return 'forecast/daily?lat=$latitude&lon=$longitude&key=$apiKey}';
  }
}
