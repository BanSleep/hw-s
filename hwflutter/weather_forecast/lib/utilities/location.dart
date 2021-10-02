import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitute;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best)
          .timeout(Duration(seconds: 5));
      latitude = position.latitude;
      longitute = position.longitude;
    } catch (e) {
      throw 'Something goes wrong: $e';
    }
  }
}
