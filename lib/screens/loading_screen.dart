import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey='264df318f6e023742dbff5cbe8687a5c';
double latitude;
double longitude;


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
    getLocationData();
  }

void getLocationData() async{
    Location location=Location();
    await location.GetCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;
    NetworkHelper networkHelper= NetworkHelper('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData= await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }),);

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}



// var conditionNumber=decoddData['weather'][0]['id'];
// var temperature=decodedData['main']['temp'];
// var city=decodedData(data)['name'];