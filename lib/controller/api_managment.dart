import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/controller/end_url.dart';
import 'package:weather_app/model/weather_model.dart';

import '../model/store_model.dart';

class ApiManager {
  String url = baseUrl;
  static getstoredata() async {
    var url = baseUrl;

    var data = await http.get(Uri.parse(url));
    var finaldata = jsonDecode(data.body);

    var storedata = Temperatures.fromJson(finaldata);
    return storedata;
  }

  static Future<WeatherModel> getWeather(String city) async {
    String url =
        baseurlweather + '/data/2.5/weather?q=$city&appid=' + apikeywether;

    var data = await http.get(Uri.parse(url));
    var finaldata = jsonDecode(data.body);
    // debugger();
    var modeldata = WeatherModel.fromJson(finaldata);
    // debugger();
    return modeldata;
  }
}
