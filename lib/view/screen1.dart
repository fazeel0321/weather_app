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

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  get city => null;

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
    getdata();
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

            return CustomImageContainer(
              imageUrl: provider.getBackgroundImage(),
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: MyColors.black.withOpacity(0.5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 20),
                      child: CustomTextWidget(
                        text: 'My Location',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: MyColors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
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
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Builder(builder: (context) {
                        var provider = context.watch<WeatherProvider>();
//
                        return CustomTextWidget(
                          text:
                              "${(provider.weatherdata!.main.temp - 273).round()}°C",
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Builder(builder: (context) {
                        var provider = context.watch<WeatherProvider>();

                        return CustomTextWidget(
                          text: '${provider.weatherdata!.weather[0].main}',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Builder(builder: (context) {
                        var provider = context.watch<WeatherProvider>();

                        return CustomTextWidget(
                          text:
                              'H: ${(provider.weatherdata!.main.tempMax - 273).round()}°C  L: ${(provider.weatherdata!.main.tempMin - 273).round()}°C',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Builder(builder: (context) {
                        var provider = context.watch<WeatherProvider>();

                        return CustomTextWidget(
                          text: '${provider.weatherdata!.weather[0].main}',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                        );
                      }),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: Builder(builder: (context) {
                        var provider = context.watch<WeatherProvider>();

                        return CustomTextWidget(
                          text: '${provider.weatherdata!.sys.country}',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        height: 40,
                        child: TextField(
                          controller: citycontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              suffixIcon: Icon(
                                Icons.search,
                                color: MyColors.white,
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (citycontroller.text.isNotEmpty) {
                          provider.getWeatherForCity(citycontroller
                              .text); // یہاں متغیر 'city' کی قیمت تبدیل ہو رہی ہے
                        }
                      },
                      child: CustomButton(
                        text: 'Search',
                        color: MyColors.black,
                        bcolor: MyColors.black,
                        padv: 10,
                      ),
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
