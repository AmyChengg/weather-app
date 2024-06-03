import 'package:flutter/material.dart';
import 'big_temp.dart';
import 'weather_condition_widget.dart';
import 'space_needle_in_a_circle.dart';
import '../weather_conditions.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key, this.tempInFarenheit=42, this.condition=WeatherCondition.rainy});

  final WeatherCondition condition;
  final int tempInFarenheit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColorForCondition(condition),
      body: SingleChildScrollView(child:
        Center(child: 
          Column(
            children: [
              Container(height: 16),
              const Padding(
                padding:  EdgeInsets.all(16.0)
              ),
              const SpaceNeedleInACircle(),
              BigTemp(tempInFarenheit),
              WeatherConditionWidget(condition),
            ]
          )
        )
      )
    );
  }

  // Colors for the weather condition 
  Color _backgroundColorForCondition(WeatherCondition condition){
    // Yellow for sunny
    // Dark grey for gloomy
    // Blue for rainy
    // Use switch expression
    return switch (condition) {
      WeatherCondition.sunny => const Color.fromARGB(182, 246, 228, 69), 
      WeatherCondition.gloomy => const Color.fromARGB(190, 225, 221, 221),
      WeatherCondition.rainy => const Color.fromARGB(255, 6, 117, 208),
    };
  }
}
