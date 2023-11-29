/*import 'package:geolocator/geolocator.dart';


class LocationPermissionService {
  late double? latitude;
  late double? longitude;

  Future<void> getCurrentLocation() async {
    Geolocator location = Geolocator();

  
     LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      bool servisEtkin = await Geolocator.isLocationServiceEnabled();
    } else {
    bool servisEtkin = await Geolocator.isLocationServiceEnabled();
    }
  }
    
  }

*/
import 'package:geolocator/geolocator.dart';

class LocationPermissionService {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    Geolocator location = Geolocator();

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // İzin yoksa izin iste
      await Geolocator.requestPermission();
    }

    // Konum servisi etkin mi diye kontrol et
    bool servisEtkin = await Geolocator.isLocationServiceEnabled();

    if (!servisEtkin) {
      // Konum servisi etkin değilse, kullanıcıya uyarı göster veya ayarlara yönlendirme yap
      // Örneğin, bir uyarı göstermek için:
      print("Konum servisi etkin değil.");
      // veya ayarlara yönlendirmek için:
      // Geolocator.openLocationSettings();
    } else {
      // Konum servisi etkinse, konumu al
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
      print("Latitude: $latitude, Longitude: $longitude");
    }
  }
}
