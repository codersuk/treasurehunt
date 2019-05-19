import 'package:location/location.dart';

class LocateFunction {
  Map<String, double> userLocation;
  Location _locationService = new Location();

  String error;
  bool _permission = false;

  void ins() async {
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.HIGH, interval: 1000);
  }

  void getLocation() async {
    ins();
    LocationData location;
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();
        }
      } else {
        print('error cannot log in');
      }
    } catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }

    userLocation = {
      "latitude": location.latitude,
      "longitude": location.longitude
    };
  }

  Future<Map<String, double>> getloc() async {
    LocationData location;
    location = await _locationService.getLocation();


    return {"latitude": location.latitude, "longitude": location.longitude};
  }
}
