import 'package:flutter/material.dart';
import 'package:weather/weather_conditions.dart';

class WeatherProvider extends ChangeNotifier {
  // Default values
  int tempInFarenheit = 0;
  WeatherCondition condition = WeatherCondition.gloomy;

  bool weatherUpdated = false; // New boolean field indicating whether it has ever gotten a weather update. False by default

  updateWeather(int newTempFarenheit, WeatherCondition newCondition){
    tempInFarenheit = newTempFarenheit;
    condition = newCondition;
    weatherUpdated = true; // Updating the weather sets it to true
    notifyListeners();
  }
}