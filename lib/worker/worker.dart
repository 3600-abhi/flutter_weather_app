import 'dart:convert';
import 'package:http/http.dart';

class worker {
  String location = "";
  String temperature = "";
  String description = "";
  String humidity = "";
  String airSpeed = "";
  String main = "";
  String currWeatherIcon = "";

  // constructor
  worker({required this.location}) {}

  Future<void> getData() async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=d56eb9af33f2e453687a7ed57ba39269");
      var response = await get(url);
      Map data = jsonDecode(response.body);

      print(data);

      //  get temperature and humidity
      temperature = (data["main"]["temp"] - 273.15).toString();
      humidity = data["main"]["humidity"].toString();

      //  get description
      description = data["weather"][0]["description"].toString();
      main = data["weather"][0]["main"].toString();
      currWeatherIcon = data["weather"][0]["icon"].toString();

      //  get air speed
      airSpeed = (data["wind"]["speed"] * 3.6).toString();
    } catch (e) {
      temperature = "NA";
      description = "NA";
      humidity = "NA";
      airSpeed = "NA";
      main = "09d";
    }
  }
}
