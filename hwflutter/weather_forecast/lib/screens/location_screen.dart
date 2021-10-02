import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_prac_with_api/api/weather_api.dart';
import 'package:weather_prac_with_api/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  void getLocationData() async {
    var weatherInfo = WeatherApi().getRequest(method: 'cnt=7&appid=1369dd6b5ae78fc9952261ab9aa236b4', isAuth: true, testMode: true);
    if(weatherInfo == null) {
      print('WeatherInfo was null : $weatherInfo');
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastScreen(locationWeather: weatherInfo,);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100,
        ),
      ),
    );
  }
}
