import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Screens/Dashboard.dart';
import '../Screens/Setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'RIT Central Library',
            style: TextStyle(fontFamily:'times new roman',color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(21, 18,110,20),
        ),
        body: SignInPage(),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    String url = 'http://127.0.0.1/library/fetchlogin.php';

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['success']) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboard(email: email)),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Login Failed"),
                content: Text("Username and password do not match."),
                actions: <Widget>[
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //SizedBox(height: 5.0),
          Image.asset(
            'assets/rit.png',
            height: 100,
            width: 500,
          ),
          SizedBox(height: 5.0),
          Image.asset(
            'assets/ritlib.jpg',
            height: 250,
            width: 500,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.0),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                login();
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Color.fromRGBO(21, 18,110,20),),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
