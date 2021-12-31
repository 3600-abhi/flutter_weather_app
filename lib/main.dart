import 'package:flutter/material.dart';
import 'package:weather_app/activity/home.dart';
import 'package:weather_app/activity/loading.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => home(),
        "loading": (context) => loading(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: loading(),
    );
  }
}
