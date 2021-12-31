import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/worker/worker.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String city = "Bahraich";
  String temperature = "";
  String description = "";
  String humidity = "";
  String airSpeed = "";
  String main = "";
  String currWeatherIcon = "";

  void startApp() async {
    await build(context);
    worker instance = worker(location: city);
    await instance.getData();
    temperature = instance.temperature;
    description = instance.description;
    humidity = instance.humidity;
    airSpeed = instance.airSpeed;
    main = instance.main;
    currWeatherIcon = instance.currWeatherIcon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "home", arguments: {
        "temperature": temperature,
        "description": description,
        "humidity": humidity,
        "airSpeed": airSpeed,
        "main": main,
        "currWeatherIcon": currWeatherIcon,
        "city": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("loading init has been executed");
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    try {
      var info = ModalRoute.of(context)!.settings.arguments;
      Map data = jsonDecode(jsonEncode(info)) as Map;
      if (data["searchedCity"] != "") city = data["searchedCity"];
    } catch (e) {}
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/wi.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Weather App",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: "cursive",
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SpinKitWave(
              size: 25,
              color: Colors.blue,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
