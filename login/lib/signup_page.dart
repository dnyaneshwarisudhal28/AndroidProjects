import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Signup extends StatelessWidget {
 Signup(){
  firebaseConfigure();
  super.key;
}
void firebaseConfigure() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
 // const Signup({super.key});
  @override
  Widget build(BuildContext context) {
   // FirebaseDatabase fb=FirebaseDatabase.instance;

    TextEditingController email =TextEditingController();
    TextEditingController pass =TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const  Text("Flutter Development",
          style: TextStyle(fontFamily: 'Montserrat-Medium',fontWeight: FontWeight.bold,fontSize: 24.0),),
        leading: IconButton(
            onPressed:() {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Update profile"),
              leading: const Icon(Icons.person),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Change password"),
              leading: const Icon(Icons.password),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //login image
              // Image.asset('assets/img.png',width: 300,height: 300,),
              Container(
                margin: const EdgeInsets.only(bottom: 40.0), // Set margin to the image
                child: Image.asset(
                  'assets/signup.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              //username textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 300.0,
                  child: TextField(
                    controller: email,
                    decoration: const  InputDecoration(
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
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration:const InputDecoration(
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
                 String em=email.text;
                 String ps = pass.text;
                 signup(em,ps);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)))
                ),
                child: const Text('Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void signup(String em, String ps) async{
   // Fluttertoast.showToast(msg: "function called");
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: em,
        password: ps,
      );
      Fluttertoast.showToast(msg: "user added successfully");
    }  catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
