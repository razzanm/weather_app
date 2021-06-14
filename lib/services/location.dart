import 'package:geolocator/geolocator.dart';

class locate {
  double latitude;
  double longitude;
  Future<void> getCurrentlocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {}
  }
}
