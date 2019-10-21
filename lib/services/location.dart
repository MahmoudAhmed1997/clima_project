import 'package:geolocator/geolocator.dart';


class Location{
  double longtitude;
  double latitude ;

  Future <void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      latitude = position.latitude;
      longtitude = position.longitude;


    } catch (e) {
      print(e);
    }
  }
}