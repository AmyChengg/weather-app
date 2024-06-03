import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/helpers/weather_checker.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/views/big_temp.dart';
import 'package:weather/views/space_needle_in_a_circle.dart';
import 'package:weather/views/weather_condition_widget.dart';
import 'package:weather/weather_conditions.dart';

class LiveWeather extends StatefulWidget {
  const LiveWeather({super.key});

  @override
  State<LiveWeather> createState() => _LiveWeatherState();
}

class _LiveWeatherState extends State<LiveWeather> {
  late Timer _weatherCheckerTimer; // Create a timer

  @override
  void initState() {
    super.initState();
    
    // The way to get a "single use" reference to the Provider that is nearest as we traverse up the Widget tree from our Widget
    final singleUseWeatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    // Create a method-local WeatherChecker instance
    final weatherChecker = WeatherChecker(singleUseWeatherProvider);
    // Re-check the weather every minute
    weatherChecker.fetchAndUpdateCurrentSeattleWeather();
    // Private property
    _weatherCheckerTimer = Timer.periodic(Duration(seconds: 60), (timer) {
      weatherChecker.fetchAndUpdateCurrentSeattleWeather(); // Ensures weather updates every minute
    });

  }

  // Cleaning up the widget by cancelling the Timer
  @override
  void dispose() {
    _weatherCheckerTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, WeatherProvider, child) {
        return Scaffold(
          backgroundColor: _backgroundColorForCondition(WeatherProvider.condition),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(height: 16),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SpaceNeedleInACircle(),
                  ),
                  BigTemp(WeatherProvider.tempInFarenheit),
                  WeatherConditionWidget(WeatherProvider.condition),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

  Color _backgroundColorForCondition(WeatherCondition condition){
    return switch (condition) {
      WeatherCondition.sunny => const Color.fromARGB(182, 246, 228, 69), 
      WeatherCondition.gloomy => Color.fromARGB(190, 225, 221, 221),
      WeatherCondition.rainy => const Color.fromARGB(255, 6, 117, 208),
    };
  }

// Make a UI for part 3
class WeatherUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Any place in the app (UI or otherwise) that needs to use that state, should get it from a Provider
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
          if (!weatherProvider.weatherUpdated) {
            // Show a simple loading message when the weather is not updated
            print('Loading weather update...');
            return CircularProgressIndicator();
          } else { // Show the temperature and weather condition
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weatherProvider.tempInFarenheit}°F',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '${weatherProvider.condition}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            );
          }
      },
    );
  }
}

