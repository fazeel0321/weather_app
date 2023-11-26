import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/provider/store_provider.dart';
import 'package:weather_app/controller/provider/weather_provider.dart';
import 'package:weather_app/model/products_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/dictionaryapi.dart';
import 'package:weather_app/view/dummyapi.dart';
import 'package:weather_app/view/fakestoreapi.dart';

import 'package:weather_app/view/imagesecondapi.dart';
import 'package:weather_app/view/login_screen.dart';
import 'package:weather_app/view/productscreen.dart';
import 'package:weather_app/view/shared_prefrances.dart';
import 'package:weather_app/view/weather_screen.dart';

import 'controller/provider/products_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => WeatherProvider())),
        // ChangeNotifierProvider(create: ((context) => StoreProvider())),
        ChangeNotifierProvider(create: ((context) => ProductProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SharedPrefrances(),
      ),
    );
  }
}
