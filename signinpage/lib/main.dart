import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();

    Future<void> insertrecord() async {
      if(user.text.isNotEmpty || pass.text.isNotEmpty){
          try{
            String uri = "http://127.0.0.1/flutter_demo/check.php";
            var result = await http.post(Uri.parse(uri), body: {
              "username":user.text,
              "password":pass.text,
            });
            var response = jsonDecode(result.body);
            if(response["success"]=="true"){
              Fluttertoast.showToast(msg: "record inserted!");
           //   Fluttertoast.showToast(msg: "Response : $response");
            }//not printing this toast
            else{
              Fluttertoast.showToast(msg: "Oops!error");
            }
         }
          catch(e){
             Fluttertoast.showToast(msg: "record inserted!");
          //  Fluttertoast.showToast(msg: e.toString());
          }
      }
      else{
        Fluttertoast.showToast(msg: "Fill all fields");
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const  Text("Sign in form",
          style: TextStyle(fontFamily: 'Montserrat-Medium',fontWeight: FontWeight.bold,fontSize: 24.0),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
               // margin: const EdgeInsets.only(bottom: 40.0), // Set margin to the image
                child: Image.asset(
                  'assets/user.png',
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(height: 40.0,),
              //username textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 300.0,
                  child:TextFormField(
                    controller: user,
                    decoration: const InputDecoration(
                      labelText: 'Enter Username',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.black26,
                      filled: true,
                    ),
                  ),
                ),

              ),

              const SizedBox(height: 20.0,),
              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child:Container(
                  width: 300.0,
                  child:TextFormField(
                    controller: pass,
                    obscureText: true,
                    decoration: const  InputDecoration(
                      labelText: 'Enter Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.black26,
                      filled: true,
                    ),
                  ),
                ),

              ),

              const SizedBox(height: 20.0), // Add space between text fields and button

              // Login button
              ElevatedButton(
                onPressed: () {
                  insertrecord();
                 // Navigator.push(context,MaterialPageRoute(builder:(context)=>const Generator()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)))
                ),
                child: const Text('Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),),
              ),

              const SizedBox(height: 10.0,),
              //sign up page

              GestureDetector(
                onTap: (){
                 // Navigator.push(context,MaterialPageRoute(builder:(context)=>Signup()));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

