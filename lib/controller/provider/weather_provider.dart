import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/controller/api_managment.dart';
import 'package:weather_app/controller/end_url.dart';

import '../../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherdata;

  getWeather() async {
    weatherdata = await ApiManager.getWeather();
    notifyListeners();
  }
}
