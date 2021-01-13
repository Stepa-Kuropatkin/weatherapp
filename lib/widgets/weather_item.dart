import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherItem extends StatelessWidget {
  final WeatherData weather;

  const WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String temperature = weather.temp.round().toString();
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                  'https://openweathermap.org/img/wn/${weather.icon}.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(new DateFormat.Hm().format(weather.date)),
                  Text(weather.main),
                ],
              ),
            ],
          ),
          Text(
            temperature + '°C',
            style: TextStyle(
                fontSize: 20,
                color:
                    (int.parse(temperature) <= 0) ? Colors.blue : Colors.amber),
          ),
        ],
      ),
    );
  }
}
