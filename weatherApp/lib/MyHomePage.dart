import 'package:flutter/material.dart';
import 'package:weatherapp/Weather.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(150, 26, 114, 218),
      appBar:  AppBar(
        backgroundColor:const Color.fromARGB(90, 26, 114, 218),
        title: const Text("Weather App"),
      ),
      body: const Weather(),
    );
  }
}
