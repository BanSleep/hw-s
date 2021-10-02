
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_prac_with_api/api/weather_api.dart';
import 'package:weather_prac_with_api/models/weather_forecast_daily.dart';
import 'package:weather_prac_with_api/widgets/bottom_list_view.dart';
import 'package:weather_prac_with_api/widgets/city_view.dart';
import 'package:weather_prac_with_api/widgets/detail_view.dart';
import 'package:weather_prac_with_api/widgets/temp_view.dart';

import 'city_screen.dart';

class WeatherForecastScreen extends StatefulWidget {

  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Map<String, dynamic> forecastObject;
  late String _cityName;
  //late String _cityName;

  @override
  void initState() {

    if(widget.locationWeather != null) {
      forecastObject = WeatherApi().getRequest(method: 'cnt=7&appid=1369dd6b5ae78fc9952261ab9aa236b4', testMode: true) as Map<String, dynamic>;
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
              forecastObject = WeatherApi().getRequest(method: 'cnt=7&appid=1369dd6b5ae78fc9952261ab9aa236b4') as Map<String, dynamic> ;
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
                forecastObject = WeatherApi().getRequest(method: 'cnt=7&appid=1369dd6b5ae78fc9952261ab9aa236b4') as Map<String, dynamic> ;
              });
            }
          }, icon: Icon(Icons.location_city))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
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
