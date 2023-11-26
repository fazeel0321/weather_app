import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/api_managment.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/image.dart';
import 'package:weather_app/view/components/custom_button.dart';

import '../controller/provider/weather_provider.dart';
import '../utils/custom_widget.dart';
import 'package:http/http.dart' as fazeel;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  get city => 'lahore';

  getdata() async {
    var provider = await context.read<WeatherProvider>();
    provider.getWeather();
  }

  getimage() {
    var provider = context.read<WeatherProvider>();
    provider.getBackgroundImage();
  }

  var citycontroller = TextEditingController();
  var slectedcity = 'lahore';
  var provider;
  @override
  void initState() {
    // getdata();
    provider = context.read<WeatherProvider>();
    provider.getWeather();
    super.initState();
  }

  getWeatherForCity(city) {
    provider.getWeatherForCity(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Builder(builder: (context) {
            var provider = context.watch<WeatherProvider>();

            return provider.weatherdata == null
                ? CircularProgressIndicator()
                : CustomImageContainer(
                    imageUrl: provider.getBackgroundImage(),
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: MyColors.black.withOpacity(0.5),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 60.0, bottom: 20.0),
                            child: CustomTextWidget(
                              text: 'My Location',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: MyColors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20.0,
                            ),
                            child: Builder(
                              builder: (context) {
                                var provider = context.watch<WeatherProvider>();
                                return CustomTextWidget(
                                  text: '${provider.weatherdata!.name}',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.white,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Builder(builder: (context) {
                              var provider = context.watch<WeatherProvider>();
//
                              return CustomTextWidget(
                                text:
                                    "${(provider.weatherdata!.main.temp - 273).round()}°C",
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Builder(builder: (context) {
                              var provider = context.watch<WeatherProvider>();

                              return CustomTextWidget(
                                text:
                                    '${provider.weatherdata!.weather[0].main}',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Builder(builder: (context) {
                              var provider = context.watch<WeatherProvider>();

                              return CustomTextWidget(
                                text:
                                    'H: ${(provider.weatherdata!.main.tempMax - 273).round()}°C  L: ${(provider.weatherdata!.main.tempMin - 273).round()}°C',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Builder(builder: (context) {
                              var provider = context.watch<WeatherProvider>();

                              return CustomTextWidget(
                                text:
                                    '${provider.weatherdata!.weather[0].main}',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              );
                            }),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 70.0),
                            child: Builder(builder: (context) {
                              var provider = context.watch<WeatherProvider>();

                              return CustomTextWidget(
                                text: '${provider.weatherdata!.sys.country}',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Container(
                              height: 40.0,
                              child: TextField(
                                controller: citycontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        if (citycontroller.text.isNotEmpty) {
                                          provider.getWeatherForCity(
                                              citycontroller.text);
                                        }
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: MyColors.white,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          )
                        ],
                      ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
