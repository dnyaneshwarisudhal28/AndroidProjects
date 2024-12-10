import 'package:flutter/material.dart';
import 'package:login/signup_page.dart';
import 'package:login/GeneratePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/firebase_options.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
    TextEditingController pass =TextEditingController();
    TextEditingController email =TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const  Text("Flutter Development")
         //style: TextStyle(fontFamily: 'Montserrat-Medium',fontWeight: FontWeight.bold,fontSize: 24.0),),
        //centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40.0), // Set margin to the image
                child: Image.asset(
                  'assets/img.png',
                  width: 300,
                  height: 300,
                ),
              ),
              //username textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 300.0,
                  child:TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      labelText: 'Enter Username',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.black26,
                      filled: true,
                    ),
                  ),
                ),

              ),

              const SizedBox(height: 10.0,),
              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child:Container(
                  width: 300.0,
                  child:TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: const
                    InputDecoration(
                      labelText: 'Enter Password',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.black26,
                      filled: true,
                    ),
                  ),
                ),

              ),

              const SizedBox(height: 16.0), // Add space between text fields and button

              // Login button
              ElevatedButton(
                onPressed: () {
                  String em = email.text;
                  String ps = pass.text;
                  signin(em,ps);
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>const Generator()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)))
                ),
                child: const Text('Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),),
              ),

               const SizedBox(height: 8.0,),
              //sign up page

              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>Signup()));
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
 void signin(String em, String ps) async{
   try {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: em,
       password: ps,
     );
     Fluttertoast.showToast(msg: "Logged in");
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       print('No user found for that email.');
     } else if (e.code == 'wrong-password') {
       print('Wrong password provided for that user.');
     }
   }
 }
}

