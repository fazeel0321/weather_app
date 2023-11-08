import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/image.dart';
import 'package:weather_app/view/components/custom_button.dart';

import '../utils/custom_widget.dart';
import 'package:http/http.dart' as fazeel;

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  var weatherdata;

  getWeather() async {
    setState(() {
      weatherdata = null;
    });
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$slectedcity&appid=4c68a3ec04a6e64968416a52d04492a5');
    var data = await fazeel.get(url);

    var finaldata = jsonDecode(data.body);
    setState(() {
      weatherdata = finaldata;
    });
  }

  var citycontroller = TextEditingController();
  var slectedcity = 'lahore';
  @override
  void initState() {
    getWeather();
    super.initState();
  }

  String getBackgroundImage() {
    if (weatherdata == null) {
      return 'images/sunny.jpg';
    }
    String weatherCondition = weatherdata['weather'][0]['main'];
    if (weatherCondition == 'Clear') {
      return 'images/sunny.jpg';
    } else if (weatherCondition == 'Clouds') {
      return 'images/cloudy.jpg';
    } else if (weatherCondition == 'Rain') {
      return 'images/thunder.jpg';
    } else {
      return 'images/winter.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherdata == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CustomImageContainer(
                  imageUrl: getBackgroundImage(),
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
                          child: CustomTextWidget(
                            text: '${weatherdata['name']}',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CustomTextWidget(
                            text:
                                "${(weatherdata['main']['temp'] - 273).round()}°C",
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CustomTextWidget(
                            text: '${weatherdata['weather'][0]['main']}',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CustomTextWidget(
                            text:
                                'H: ${(weatherdata['main']['temp_max'] - 273).round()}°C  L: ${(weatherdata['main']['temp_min'] - 273).round()}°C',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CustomTextWidget(
                            text: '${weatherdata['weather'][0]['main']}',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: CustomTextWidget(
                            text: '${weatherdata['sys']['country']}',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
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
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: MyColors.white,
                                  )),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (citycontroller.text.isEmpty) {
                            } else {
                              slectedcity = citycontroller.text;
                              getWeather();
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
                )
              ],
            ),
    );
  }
}
