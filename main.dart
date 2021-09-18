import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.deepOrange[800],
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Weather Forecast',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Enter City Name',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Murmansk Oblast, RU',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Friday, Mar 20, 2020',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 70,
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                        Text(
                          '14 °F',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'LIGHT SNOW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Icon(Icons.ac_unit, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text(
                          '5',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'km/h',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.ac_unit, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text(
                            '3',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.ac_unit, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text(
                            '20',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Text(
                  '7-DAY WEATHER FORECAST',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Container(
                  height: 110,
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10,);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index){
                      return SizedBox(
                        height: 100,
                        width: 125,
                        child: Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                getDayName(index),
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${getRandomTemp()} °F',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.wb_sunny, color: Colors.white),

                                ],
                              ),
                            ],
                          ),
                        ),
                      );

                    },

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  String getDayName(int index) {
    switch(index) {
      case 0:
        return "Monday";
      case 1: return "Tuesday";
      case 2: return "Wednesday";
      case 3: return "Thursday";
      case 4: return "Friday";
      case 5: return "Saturday";
      case 6: return "Sunday";
    }
    return "";
  }
  int getRandomTemp() {
    final x = Random();
    return x.nextInt(30);
  }
}