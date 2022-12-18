// ignore_for_file: unused_field, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/api_service.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  List<Result>? weathers = [];
  late Future<void> _value;
  late Future<Weather> weather;
  @override
  void initState() {
    setState(() {
      weather = getDate("konya");
    });
    super.initState();
  }

  Future<List<Weather>?> getDate0(String city) async {
    ApiService.getWeatherDataByCity(city).then((data) {
      var resultBody = json.decode(data.body);

      return (resultBody.map((e) => Weather.fromJson(e)).toList());
    });
    return null;
  }

  Future<Weather> getDate(String city) async {
    final response = await http.get(
        Uri.parse("https://172.28.64.1:7079/api/Activity")
        // Uri.parse(
        //     "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city"),
        // headers: {
        //   HttpHeaders.authorizationHeader:
        //       'apikey 32j9cWNjp8LvgdHuJHCqEA:26Q3GYJNV8MH0S0BKU2yT8',
        //   HttpHeaders.contentTypeHeader: 'application/json'
        // });
        );
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: FutureBuilder<Weather>(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.result![0].degree.toString());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      )),
    );
    // body: Text(weathers![0].degree == null
    //     ? "text"
    //     : weathers![0].degree.toString()));
  }
}
