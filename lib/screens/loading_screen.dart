import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();


}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState(
    );
    GetLocation();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  void GetLocation()async{
    LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(permission);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
