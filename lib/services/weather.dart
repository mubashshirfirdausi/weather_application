import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey =
    '46b8930bd2220424ded66b65990ceef7'; //'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const openWeatherMapAQIURL =
    'http://api.openweathermap.org/data/2.5/air_pollution';

//Creating class to get Weather Data by two ways (1. By Current Location 2. By City Name)
class WeatherModel {
  //Function to get Weather Data by Current Location
  Future<dynamic> getLocationWeather() async {
    //Getting Current Location i.e. Lattitude and Longitude
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  //Function to get Weather Data by City Name
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getAQI() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapAQIURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');

    var airPollutionData = await networkHelper.getData();

    return airPollutionData;
  }
}
