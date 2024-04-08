import 'package:geolocator/geolocator.dart';

class Location {
  var longitude;
  var latitude;

  Future getLocation() async {
    try{
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();

        if(permission != LocationPermission.denied){
          Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
          latitude = position.latitude;
          longitude = position.longitude;
        }
      }
    }
    catch(e){
      print(e);
    }

  }
}