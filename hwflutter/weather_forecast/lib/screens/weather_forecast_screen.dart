import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_prac/api/weather_api.dart';
import 'package:weather_prac/models/weatherForecastDaily.dart';
import 'package:weather_prac/screens/city_screen.dart';
import 'package:weather_prac/widgets/bottom_list_view.dart';
import 'package:weather_prac/widgets/city_view.dart';
import 'package:weather_prac/widgets/detail_view.dart';
import 'package:weather_prac/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {

  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName;
  //late String _cityName;

  @override
  void initState() {

    if(widget.locationWeather != null) {
      forecastObject = WeatherApi().fetchWeatherForecast();
    }
    super.initState();

    // forecastObject.then((weather) {
    //   print(weather.list![0].weather[0].main);
    // }
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Weather Forecast'
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });

          },
        ),
        actions: [
          IconButton(onPressed: () async {
            var tappedName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CityScreen();
            }));
            if(tappedName != null) {
              setState(() {
                _cityName = tappedName;
                forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName, isCity: true);
              });
            }
          }, icon: Icon(Icons.location_city))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50,),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50,),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50,),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50,),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: SpinKitDoubleBounce(color: Colors.black, size: 100,),

                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
