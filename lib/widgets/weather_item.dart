import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherItem extends StatelessWidget {
  final WeatherData weather;

  const WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weather.name),
            Text(weather.main),
            Text('${weather.temp.round().toString()}°C'),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text(new DateFormat.yMMMd().format(weather.date)),
            Text(new DateFormat.Hm().format(weather.date)),
          ],
        ),
      ),
    );
  }
}
