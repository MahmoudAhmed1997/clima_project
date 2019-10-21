import 'package:clima_project/services/networking.dart';
import 'package:clima_project/services/location.dart';
const apiKey = '6656e9dc105fbb0887aaf8375fa2bf45';


class WeatherModel {

  Future<dynamic> getCityWeather (String cityName)async{
    var url = 'https://samples.openweathermap.org/data/2.5/weather?q=&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getDataNetwork();
    return weatherData ;
  }
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://samples.openweathermap.org/data/2.5/weather?lat=${location
            .latitude}&lon=${location.longtitude}&appid=$apiKey');
    var weatherData = await networkHelper.getDataNetwork();
    return weatherData;
  }
    String getWeatherIcon(int condition) {
      if (condition < 300) {
        return '🌩';
      } else if (condition < 400) {
        return '🌧';
      } else if (condition < 600) {
        return '☔️';
      } else if (condition < 700) {
        return '☃️';
      } else if (condition < 800) {
        return '🌫';
      } else if (condition == 800) {
        return '☀️';
      } else if (condition <= 804) {
        return '☁️';
      } else {
        return '🤷‍';
      }
    }

    String getMessage(int temp) {
      if (temp > 25) {
        return 'It\'s 🍦 time';
      } else if (temp > 20) {
        return 'Time for shorts and 👕';
      } else if (temp < 10) {
        return 'You\'ll need 🧣 and 🧤';
      } else {
        return 'Bring a 🧥 just in case';
      }
    }
  }