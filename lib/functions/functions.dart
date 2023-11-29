import 'package:theweather/models/hourly_weather_model.dart';
import 'package:uuid/uuid.dart';
///find which day we are in
String? findDayOfWeek(int index) {
  DateTime now = DateTime.now();
  int dayOfWeek = now.weekday;
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  String currentDay;
  switch (index) {
    case 6:
      return 'Today';
    case 0:
      currentDay = daysOfWeek[dayOfWeek % 7];
      return currentDay;
    case 1:
      currentDay = daysOfWeek[(dayOfWeek + 1) % 7];
      return currentDay;
    case 2:
      currentDay = daysOfWeek[(dayOfWeek + 2) % 7];
      return currentDay;
    case 3:
      currentDay = daysOfWeek[(dayOfWeek + 3) % 7];
      return currentDay;
    case 4:
      currentDay = daysOfWeek[(dayOfWeek + 4) % 7];
      return currentDay;
    case 5:
      currentDay = daysOfWeek[(dayOfWeek + 5) % 7];
      return currentDay;
  }
}

///getHour
String? getHour(
  String? hour,
) {
  if (hour != null) {
    return hour[11] + hour[12];
  }
}
///fetch hourlyList according to days
List<Data>? getHourlyList(List<Data>? datas, int index) {
  List<Data> datasForDay = [];
  int daysChooser = 0;
  switch (index) {
    case 0:
      for (int i = 0; i < 24; i++) {
        if (datas?[i].timestampLocal?[11] == '0' &&
            datas?[i].timestampLocal?[12] == '0') {
          daysChooser = i;
        }
        if (daysChooser == i && i != 0) {
          for (int j = i; j < i + 24; j++) {
            datasForDay.add(datas![j]);
          }
          return datasForDay;
        }
      }

    case 1:
      for (int i = 24; i < 48; i++) {
        if (datas?[i].timestampLocal?[11] == '0' &&
            datas?[i].timestampLocal?[12] == '0') {
          daysChooser = i;
        }
        if (daysChooser == i && i != 0) {
          for (int j = i; j < i + 24; j++) {
            datasForDay.add(datas![j]);
          }
          return datasForDay;
        }
      }
    case 2:
      for (int i = 48; i < 72; i++) {
        if (datas?[i].timestampLocal?[11] == '0' &&
            datas?[i].timestampLocal?[12] == '0') {
          daysChooser = i;
        }
        if (daysChooser == i && i != 0) {
          for (int j = i; j < i + 24; j++) {
            datasForDay.add(datas![j]);
          }
          return datasForDay;
        }
      }
    case 3:
      for (int i = 72; i < 96; i++) {
        if (datas?[i].timestampLocal?[11] == '0' &&
            datas?[i].timestampLocal?[12] == '0') {
          daysChooser = i;
        }
        if (daysChooser == i && i != 0) {
          for (int j = i; j < i + 24; j++) {
            datasForDay.add(datas![j]);
          }
          return datasForDay;
        }
      }
    case 4:
      for (int i = 96; i < 120; i++) {
        if (datas?[i].timestampLocal?[11] == '0' &&
            datas?[i].timestampLocal?[12] == '0') {
          daysChooser = i;
        }
        if (daysChooser == i && i != 0) {
          for (int j = i; j < i + 24; j++) {
            datasForDay.add(datas![j]);
          }
          return datasForDay;
        }
      }
    case 5:
      for (int i = 120; i < 144; i++) {
        if (datas?[i].timestampLocal?[11] == '0' &&
            datas?[i].timestampLocal?[12] == '0') {
          daysChooser = i;
        }
        if (daysChooser == i && i != 0) {
          for (int j = i; j < i + 24; j++) {
            datasForDay.add(datas![j]);
          }
          return datasForDay;
        }
      }
    case 6:
      for (int i = 0; i < 24; i++) {
        datasForDay.add(datas![i]);
      }
      return datasForDay;
  }
}
///create a unique id for hive...there is no id in api
String generateUniqueID() {
  var uuid = Uuid();
  return uuid.v4();
}
