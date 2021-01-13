class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String description;
  final String icon;
  final String country;

  WeatherData({this.date, this.name, this.temp, this.description, this.icon, this.country});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      country: json['sys']['country']
    );
  }
}
