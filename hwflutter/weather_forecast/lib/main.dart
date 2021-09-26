import 'package:flutter/material.dart';
import 'package:weather_prac/screens/location_screen.dart';

import 'screens/weather_forecast_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LocationScreen(),
    );
  }
}

