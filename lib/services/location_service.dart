import 'package:location/location.dart';
import 'package:ecommerce_app/config/secrets.dart' as secrets;

class LocationService {
  static Future<LocationData?> _getUserLocation() async {
    try {
      final coordinates = await Location.instance.getLocation();
      return coordinates;
    } catch (error) {
      return null;
    }
  }

  static String getCoordinates(double latitude, double longitude) {
    return '$latitude, $longitude';
  }

  static Future<String> getMapSnapshotUrl({double? lat, double? long}) async {
    double latitude;
    double longitude;

    if (lat != null && long != null) {
      latitude = lat;
      longitude = long;
    } else {
      final location = await _getUserLocation();

      if (location == null ||
          location.latitude == null ||
          location.longitude == null) {
        return "";
      }

      latitude = location.latitude!;
      longitude = location.longitude!;
    }

    final coordinates = getCoordinates(latitude, longitude);

    return "https://maps.googleapis.com/maps/api/staticmap?center=$coordinates&markers=color:red%7Clabel:A%7C$coordinates&zoom=12&size=400x400&key=${secrets.GOOGLE_MAP_API_KEY}";
  }
}
