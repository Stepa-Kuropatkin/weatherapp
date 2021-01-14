class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String description;
  final String icon;
  final String country;
  final int humidity;
  final int pressure;
  final double speed;
  final double feelsLike;

  WeatherData(
      {this.date,
      this.name,
      this.temp,
      this.description,
      this.icon,
      this.country,
      this.feelsLike,
      this.humidity,
      this.pressure,
      this.speed});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      country: json['sys']['country'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      feelsLike: json['main']['feels_like'].toDouble(),
      speed: json['wind']['speed'].toDouble(),

    );
  }
}
