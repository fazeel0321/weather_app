import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart' as lottie;

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  var word = '';
  var definitions = [];
  var isLoading = false;

  getDefinitions() async {
    setState(() {
      isLoading = true;
    });
    var url =
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
    var data = await http.get(url);
    var finaldata = jsonDecode(data.body);
    setState(() {
      if (finaldata.isNotEmpty) {
        definitions = finaldata[0]['meanings'];
      } else {
        definitions = [
          {
            'partOfSpeech': '',
            'definitions': [
              {'definition': 'Definition not found.', 'example': ''}
            ]
          }
        ];
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Dictionary',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'fonts/Bold.ttf'),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 246, 247, 234),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blueGrey,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a word',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    word = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                getDefinitions();
              },
              child: isLoading
                  ? lottie.Lottie.asset(
                      'loader/loader.json',
                      height: 50,
                      width: 50,
                    )
                  : Text('Search'),
              // style: ElevatedButton.styleFrom(fixedSize: Size(10, 20)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            definitions.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: definitions.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: 30, top: 10, right: 30, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  definitions[index]['partOfSpeech'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  definitions[index]['definitions'][0]
                                      ['definition'],
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
