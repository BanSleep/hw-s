import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.red,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
  );
}
