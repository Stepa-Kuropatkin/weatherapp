import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/forecast_model.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/widgets/weather_item.dart';
import 'package:http/http.dart' as http;

class WeeklyWeather extends StatefulWidget {
  WeeklyWeather({Key key}) : super(key: key);

  @override
  _WeeklyWeatherState createState() => _WeeklyWeatherState();
}

class _WeeklyWeatherState extends State<WeeklyWeather> {
  bool isLoading = false;

  WeatherData weatherData;
  ForecastData forecastData;

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }

    if (position != null) {
      final lat = position.latitude;
      final lon = position.longitude;

      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${lon.toString()}&units=metric&appid=93f5125b22308c4d1a74be841366d998');
      final forecastResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${lat.toString()}&lon=${lon.toString()}&units=metric&appid=93f5125b22308c4d1a74be841366d998');

      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
              new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
              new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: isLoading
              ? Text('')
              : Text(
                  weatherData.name,
                ),
        ),
      ),
      backgroundColor: Colors.white,
      body: forecastData != null
          ? ListView.separated(
              itemCount: forecastData.list.length,
              itemBuilder: (context, index) => WeatherItem(
                weather: forecastData.list.elementAt(index),
              ),
              separatorBuilder: (context, index) {
                return Divider();
              },
            )
          : Center(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  )),
            ),
    );
  }
}
