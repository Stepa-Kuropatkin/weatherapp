import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weather extends StatelessWidget {
  final WeatherData weather;

  const Weather({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String temperature = weather.temp.round().toString();

    return Container(
      child: Column(
        children: [
          Image.network(
              'https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
          Text(weather.name + ', ' + weather.country),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weather.description[0].toUpperCase() +
                    weather.description.substring(1),
                style: TextStyle(fontSize: 26.0, color: Colors.black38),
              ),
              SizedBox(width: 4),
              Text(
                temperature + '°C',
                style: TextStyle(
                    fontSize: 32.0,
                    color: (int.parse(temperature) <= 0)
                        ? Colors.blue
                        : Colors.amber),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
