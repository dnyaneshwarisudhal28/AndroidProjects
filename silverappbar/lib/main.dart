import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Registration Form',
          style:TextStyle(fontFamily: 'times new roman',fontSize: 30.0),),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),

        body: TextFormField(
          decoration: const InputDecoration(
            border:  UnderlineInputBorder(),
            hintText: "Enter username",
          ),
        ),
      ),
    );
  }
}

