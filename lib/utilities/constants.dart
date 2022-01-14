import 'package:flutter/material.dart';

const kWeatherDescriptionStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87);
const kTemperatureStyle = TextStyle(fontSize: 70, color: Colors.black87);
const kDegreeStyle = TextStyle(fontSize: 30, color: Colors.black87);
const kWindSpeedStyle = TextStyle(fontSize: 40, color: Colors.black87);
const kWindSpeedUnitStyle = TextStyle(fontSize: 15, color: Colors.black87);
const kHumidityStyle = TextStyle(fontSize: 40, color: Colors.black87);
const kHumidityUnitStyle = TextStyle(fontSize: 15, color: Colors.black87);
const kButtonTextStyle = TextStyle(fontSize: 25.0);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Hero(
    tag: 'liveIcon',
    child: Icon(
      Icons.search,
      color: Colors.white,
      size: 40,
    ),
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
