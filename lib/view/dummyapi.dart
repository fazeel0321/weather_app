import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DummmyApi extends StatefulWidget {
  const DummmyApi({super.key});

  @override
  State<DummmyApi> createState() => _DummmyApiState();
}

class _DummmyApiState extends State<DummmyApi> {
  var dummydata;
  getdummydata() async {
    var url = Uri.parse('https://dummyapi.online/api/movies');
    var data = await http.get(url);
    var finaldata = jsonDecode(data.body);
    setState(() {
      var dummydata = finaldata;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdummydata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: dummydata == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dummydata.lenght,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Text(dummydata[i]["image"]),
                    title: Text(dummydata[i]['movie']),
                    subtitle: Text(dummydata[i]['imdb_url']),
                    trailing: Text(dummydata[i]['rating']),
                  );
                }));
  }
}
