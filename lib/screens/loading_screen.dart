import 'dart:math';
import 'package:clima_project/services/location.dart';
import 'package:clima_project/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:clima_project/services/networking.dart';
import 'location_screen.dart';
import 'package:weather/weather.dart';

const apiKey = '6656e9dc105fbb0887aaf8375fa2bf45';

class Loading_Screen extends StatefulWidget {
  @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  double longitude;
  double latitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData =await WeatherModel().getLocationWeather();


    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Loaction_Screen(locationWeather: weatherData);

      }));

    // print(data);
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.red,
            size: 100.0,
          ),
        ),
      );
    }
  }


