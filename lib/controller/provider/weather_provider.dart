import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/controller/api_managment.dart';
import 'package:weather_app/controller/end_url.dart';

import '../../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherdata;
  String city = 'lahore';
  getWeather() async {
    weatherdata = await ApiManager.getWeather(city);
    notifyListeners();
  }

  getBackgroundImage() {
    if (weatherdata == null) {
      return 'images/sunny.jpg';
    }
    var weatherCondition = weatherdata!.weather[0].main;
    if (weatherCondition == 'Clear') {
      return 'images/winter.jpg';
    } else if (weatherCondition == 'Clouds') {
      return 'images/cloudy.jpg';
    } else if (weatherCondition == 'Rain') {
      return 'images/thunder.jpg';
    } else {
      return 'images/winter.jpg';
    }
  }

  getWeatherForCity(String newCity) async {
    weatherdata = null;
    notifyListeners();
    city = newCity;
    weatherdata = await ApiManager.getWeather(city);
    notifyListeners();
  }
}
