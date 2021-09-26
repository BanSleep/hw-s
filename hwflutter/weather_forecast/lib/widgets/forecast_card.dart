import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_prac/utilites/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(snapshot.data!.list[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = snapshot.data!.list[index].temp.min.toStringAsFixed(0);
  var icon = snapshot.data!.list[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            dayOfWeek,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            //dayOfWeek
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin °C',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,

                      ),

                    ),
                  ),
                  Image.network(icon, scale: 1.2, color: Colors.white,)
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}
