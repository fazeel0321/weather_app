import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/provider/store_provider.dart';
import 'package:weather_app/controller/provider/weather_provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/dictionaryapi.dart';
import 'package:weather_app/view/dummyapi.dart';
import 'package:weather_app/view/fakestoreapi.dart';

import 'package:weather_app/view/imagesecondapi.dart';
import 'package:weather_app/view/productscreen.dart';
import 'package:weather_app/view/screen1.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => WeatherProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: screen1(),
      ),
    );
  }
}
