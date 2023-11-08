import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HeightAdjusterScreen2 extends StatefulWidget {
  @override
  _HeightAdjusterScreenState createState() => _HeightAdjusterScreenState();
}

class _HeightAdjusterScreenState extends State<HeightAdjusterScreen2> {
  var height = 100.0;
  var width = 100.0;
  var name = 'Arham';
  var imagedata;
  var Loading = false;

  getdata() async {
    // setState(() {
    //   Loading = true;
    // });
    var imgUrl =
        "https://hub.dummyapis.com/image?text=$name&height=$height&width=$width";
    // var url = Uri.parse(
    //     'https://hub.dummyapis.com/image?text=$name&height=$height&width=$width');
    // var data = await http.get(url);
    // var finaldata = jsonDecode(data.body);
    setState(() {
      imagedata = imgUrl;
      // Loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Text',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Height',
              ),
              onChanged: (value) {
                setState(() {
                  height = double.parse(value);
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Width',
              ),
              onChanged: (value) {
                setState(() {
                  width = double.parse(value);
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                getdata();
              },
              child: Loading
                  ? Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : Text('Generate')),
          SizedBox(
            height: 30,
          ),
          imagedata != null ? Image.network(imagedata) : Container(),
        ],
      ),
    );
  }
}
