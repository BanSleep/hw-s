import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _toggled = false;
    return MaterialApp(
      home: ChangeNotifierProvider<colorProvider>.value(
          value: colorProvider(),
          child: switchList()
      ),
    );
  }
}



class switchList extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _switchListState();
  }
}

class _switchListState extends State<switchList> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    colorProvider _state = Provider.of<colorProvider>(context);
    return ChangeNotifierProvider<colorProvider>.value(value: colorProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Homework Provider',
            style: TextStyle(
              color: _state.colorValueAppBar,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                  duration: Duration(seconds: 0),
                  width: 150,
                  height: 150,
                  color: _state.colorValue
              ),
              Center(
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.only(right: 175),
                    value: _toggled,
                    onChanged: (bool value) {
                      setState(() {
                        _toggled = value;
                        _state.changeColorRandomly();
                        _state.changeColorAppBar();
                      });
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class colorProvider extends ChangeNotifier {
  Color randomColor = Colors.green;
  Color randomColorAppBar = Colors.green;

  Color get colorValue => randomColor;
  Color get colorValueAppBar => randomColorAppBar;

  void changeColorRandomly() {
    randomColor = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
    notifyListeners();
  }
  void changeColorAppBar() {
   randomColorAppBar = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
   notifyListeners();
  }
}