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
          Image.network(
              'https://openweathermap.org/img/wn/${weather.icon}.png'),
          Column(
            children: [
              Text(new DateFormat.Hm().format(weather.date), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black38),),
              SizedBox(height: 8.0),
              Text(weather.description, style: TextStyle(),),
              SizedBox(height: 8.0),
              Text(DateFormat.MMMEd('ru').format(weather.date), style: TextStyle(color: Colors.black26, fontSize: 12),)
            ],
          ),
          Text(
            temperature + '°',
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
