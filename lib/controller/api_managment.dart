import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/controller/end_url.dart';

import '../model/store_model.dart';

class ApiManager {
  String url = baseUrl;
  getstoredata() async {
    var url = baseUrl;

    var data = await http.get(Uri.parse(url));
    var finaldata = jsonDecode(data.body);

    var storedata = Temperatures.fromJson(finaldata);
    return storedata;
  }
}
