import 'dart:convert';

class WeatherData{
  final String name;
  final double temp;
  final String main;
  final String icon;

  WeatherData({required this.name, required this.temp, required this.main, required this.icon});

  static WeatherData deserialize(String json){
    JsonDecoder decoder = const JsonDecoder();
    var map = decoder.convert(json);
    String name = map['name'] ?? '';
    double temp = map['main']['temp']?.toDouble() ?? 0.0;
    String main = map['weather'][0]['main'] ?? '';
    String icon = map['weather'][0]['icon'] ?? '';

    return WeatherData(name: name, temp: temp, main: main, icon: icon);
  }
}