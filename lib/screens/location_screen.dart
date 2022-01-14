import 'package:clima/utilities/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //Declaring variables to store Weather Data
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;
  String weatherDescription;
  String humidity;
  String windSpeed;
  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          // weatherIcon = 'Error';
          weatherMessage = 'Unable to get weather data';
          cityName = 'No Data';
          return;
        }
        //Assigning Weather Description
        weatherDescription = weatherData['weather'][0]['main'];

        //Assigning Icon
        weatherIcon = weatherData['weather'][0]['icon'];

        //Assigning City Name
        cityName = weatherData['name'];

        //Assigning temperature
        var temp = weatherData['main']['temp'];
        temperature = temp.toInt();

        //Assigning Humidity
        int humid = weatherData['main']['humidity'];
        humidity = humid.toString();

        //Assigning Wind Speed
        var wndSpd = weatherData['wind']['speed'];
        windSpeed = wndSpd.toString();

        // weatherMessage = weather.getMessage(temperature);
        // var condition = weatherData['weather'][0]['id'];
        // weatherIcon = weather.getWeatherIcon(condition);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue.shade900, Colors.blue.shade300],
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.near_me,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          Text(
                            'Get current Location',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        if (typedName != null) {
                          var weatherData =
                              await weather.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: Hero(
                        tag: 'liveIcon',
                        child: Icon(
                          Icons.search,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // height: 650,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        ReusableCard(
                          cardHeight: 120,
                          cardChild: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network(
                                  'http://openweathermap.org/img/wn/$weatherIcon@2x.png',
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$weatherDescription',
                                      style: kWeatherDescriptionStyle),
                                  Text(
                                    'in $cityName',
                                    style: kWeatherDescriptionStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Temperature Card
                        ReusableCard(
                          cardHeight: 180,
                          cardChild: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temperature.toString(),
                                  style: kTemperatureStyle,
                                ),
                                Text(
                                  '°C',
                                  style: kDegreeStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            // Humidity Card
                            Expanded(
                              child: ReusableCard(
                                cardHeight: 150,
                                cardChild: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      humidity,
                                      style: kHumidityStyle,
                                    ),
                                    Text(
                                      '%',
                                      style: kHumidityUnitStyle,
                                    )
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            // Wind Speed Card
                            Expanded(
                              child: ReusableCard(
                                cardHeight: 150,
                                cardChild: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        windSpeed,
                                        style: kWindSpeedStyle,
                                      ),
                                      Text(
                                        'km/h',
                                        style: kWindSpeedUnitStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Data provided by Open Weather Map',
                          style: kHumidityUnitStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
