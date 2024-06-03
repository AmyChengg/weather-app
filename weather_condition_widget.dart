import 'package:flutter/material.dart';
import 'package:weather/weather_conditions.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget(this.condition, {super.key });

  final WeatherCondition condition;
  
  // Assign values to build's method-local iconToShow and textToShow using the value of condition. 
  // Using switch expressions
  // Using switch expression to show the appropriate icon based on weather condition
  @override
  Widget build(BuildContext context) {
    IconData iconToShow = switch (condition) { 
      WeatherCondition.gloomy => Icons.cloud, // Cloud icon
      WeatherCondition.sunny => Icons.wb_sunny, // Sun icon
      WeatherCondition.rainy => Icons.water_drop, // Waterdrop icon
    };

    // final iconToShow = Icons.____; // TODO(you): Choose an appropriate icon based on condition
    // final textToShow = 
    // TODO(you): Generate appropriate text to show based on weather condition 
    String textToShow = switch (condition) {
      WeatherCondition.gloomy => 'Cloudy', // Cloudy for cloud icon
      WeatherCondition.sunny => 'Sunny',
      WeatherCondition.rainy => 'Raining',
    };


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconToShow),
        Text(
          textToShow,
          style: TextStyle(fontSize: 24)
        ),
      ]
    );
  }
}
