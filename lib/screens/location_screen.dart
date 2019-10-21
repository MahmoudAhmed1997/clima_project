import 'package:clima_project/screens/city.dart';
import 'package:clima_project/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather/weather.dart';

class Loaction_Screen extends StatefulWidget {
  Loaction_Screen({this.locationWeather});

  final locationWeather;
  @override
  _Loaction_ScreenState createState() => _Loaction_ScreenState();
}

class _Loaction_ScreenState extends State<Loaction_Screen> {
  WeatherModel weather = WeatherModel();
  int tempDesc;
  String weather_icon;
  String cityName;
  String weatherMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUi(widget.locationWeather);
  }

  Future<void> updateUi(dynamic weatherData) async {
    setState(() {

      if(weatherData==null){
        tempDesc =0;
        weather_icon='error';
        weatherMessage='unablre to get weather';
        cityName =' ';
        return;

      }
      double temp = weatherData['main']['temp'];
      tempDesc = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weather_icon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(tempDesc);
      print(tempDesc);
      print(cityName);
      print(weather_icon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedname = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => city()));
                      if(typedname != null ){
                        var weatherData =await weather.getCityWeather(typedname);
                            updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempDesc',
                      style: TextStyle(color: Colors.orange, fontSize: 35),
                    ),
                    Text(
                      weather_icon,
                      style: TextStyle(color: Colors.green, fontSize: 35),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
