import 'package:flutter/material.dart';
import './views/current_weather.dart';
import './views/live_weather.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // Subgoal 1: Instantiated a WeatherProvider for our Consumer<WeatherProvider> to get updates from
  @override
  Widget build(BuildContext context) {   
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child:  const MaterialApp(
          home: LiveWeather()
      )
    );
  }
}
