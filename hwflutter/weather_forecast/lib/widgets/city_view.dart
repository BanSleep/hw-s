import 'package:flutter/material.dart';
import 'package:weather_prac_with_api/models/weather_forecast_daily.dart';
import 'package:weather_prac_with_api/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({required this.snapshot});


  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt*1000);
    var city = snapshot.data?.city.name;
    var country = snapshot.data?.city.country;
    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black87),
          ),
          Text(
            '${Util.getFormattedDate(formattedDate)}',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
