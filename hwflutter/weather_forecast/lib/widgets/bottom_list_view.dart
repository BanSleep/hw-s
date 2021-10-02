import 'package:flutter/material.dart';
import 'package:weather_prac_with_api/models/weather_forecast_daily.dart';

import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: snapshot.data!.list!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              color: Colors.black87,
              height: 160,
              child: forecastCard(snapshot, index),
              // child: forecastCard(snapshot, index),
            ),
          ),
        )
      ],
    );
  }
}
