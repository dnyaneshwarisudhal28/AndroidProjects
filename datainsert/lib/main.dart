import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home:  MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController mobile= TextEditingController();

  Future<void> senddata() async {
  //  final response = await http.post("http://localhost/insertdata/insertdata.php",
    String uri = "http://localhost/insertdata/insertdata.php";
    var result = await http.post(Uri.parse(uri),  body: {
      "name": name.text,
      "email": email.text,
      "mobile":mobile.text,
    });
    var response = jsonDecode(result.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data inserted successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Oops! error.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registeration"),
      backgroundColor: Colors.pinkAccent,),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30.0,),
             const Text("Username",style: TextStyle(fontSize: 18.0),),
              SizedBox(
                width: 500.0,
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                      hintText: 'name'
                  ),
                ),
              ),
              const SizedBox(height: 30.0,),

              const Text("Email",style: TextStyle(fontSize: 18.0),),

              SizedBox(
                width: 500,
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      hintText: 'Email',

                  ),
                ),
              ),
              const SizedBox(height: 30.0,),
             const Text("Mobile",style: TextStyle(fontSize: 18.0),),

              SizedBox(
                width: 500,
                child: TextField(
                  controller: mobile,
                  decoration: const InputDecoration(
                      hintText: 'Mobile'
                  ),
                ),
              ),

              const SizedBox(height: 30.0,),
              ElevatedButton(
                child: const Text("Register"),
                onPressed: (){
                  senddata();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}