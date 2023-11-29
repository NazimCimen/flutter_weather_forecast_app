import 'package:hive/hive.dart';
part 'locations.g.dart';
@HiveType(typeId: 1)
class Locations {
  Locations({required this.lat, required this.lon});
  @HiveField(0)
  double lat;

  @HiveField(1)
  double lon;
}
