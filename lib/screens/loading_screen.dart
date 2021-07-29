import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import '../services/weather.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';


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

    WeatherModel weatherModel=WeatherModel();
    var weatherData= await weatherModel.locationWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
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


