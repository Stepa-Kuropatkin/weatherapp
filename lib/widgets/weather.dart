import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weather extends StatelessWidget {
  final WeatherData weather;

  const Weather({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String temperature = weather.temp.round().toString();
    String temperatureFeelsLike = weather.feelsLike.round().toString();
    double mmhgPressure = weather.pressure * 0.75;

    return Center(
      child: Column(
        children: [
          Image.network(
              'https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
          Text(weather.name + ', ' + weather.country),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    weather.description[0].toUpperCase() +
                        weather.description.substring(1),
                    style: TextStyle(fontSize: 26.0, color: Colors.black38),
                  ),
                ),
              ),
              SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  temperature + '°C',
                  style: TextStyle(
                      fontSize: 32.0,
                      color: (int.parse(temperature) <= 0)
                          ? Colors.blue
                          : Colors.amber),
                ),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              Text('Ощущается как:'),
              Text(
                temperatureFeelsLike + '°',
                style: TextStyle(
                    fontSize: 32.0,
                    color: (int.parse(temperature) <= 0)
                        ? Colors.blue
                        : Colors.amber),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              'https://apple48.ru/assets/images/vlaga.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            weather.humidity.toString() + '%',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              'https://www.pngitem.com/pimgs/m/16-160892_disney-cars-png-cars-3-lightning-mcqueen-transparent.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            weather.speed.toStringAsFixed(1).toString() +
                                ' км/ч',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              'https://thumbs.dreamstime.com/b/d-person-under-pressure-illustration-stress-confused-man-hit-many-falling-arrows-rendering-human-people-character-30629483.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            mmhgPressure.round().toString() + ' мм рт. ст.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 200,
            child: Image.network(
              'https://3.bp.blogspot.com/-WOduZAGXB6A/Wnu8O331cwI/AAAAAAAAWlo/Ch_IUzox-xoV5LDwnaj_FxL6NqmjWMKxQCLcBGAs/s1600/Misc_banner_annoying_scam.gif',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
