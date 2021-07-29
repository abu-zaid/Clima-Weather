import 'package:geolocator/geolocator.dart';


class Location{
  Location({this.latitude,this.longitude});
  double latitude;
  double longitude;


  Future<void> GetCurrentLocation()async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
      print(position);
    } catch(e){
      print(e);
    }
  }

}
