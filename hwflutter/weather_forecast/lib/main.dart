import 'package:eticon_api/eticon_api.dart';
import 'package:flutter/material.dart';
import 'package:weather_prac_with_api/screens/location_screen.dart';

import 'screens/weather_forecast_screen.dart';

void main() async {
  Api.init(baseUrl: 'https://api.openweathermap.org/data/2.5/forecast/daily?q=London&');
  bool tokenLoaded = await Api.loadTokenFromMemory();
  if (tokenLoaded) {
    print(Api.token);
  }
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
