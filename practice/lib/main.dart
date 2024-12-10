import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Login Page', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Container(
                width: 300,
                height: 300,
                child: Image.asset('assets/login.png'),
              ),

              Container(
                margin: const EdgeInsets.only(right: 400),
                child: const Text('Username:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),

            const SizedBox(height:10),
           Container(
             width: 500,
             child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                 //   border: OutlineInputBorder(),
                  ),
                ),
           ),
            const  SizedBox(height: 20.0),

              Container(
                margin: const EdgeInsets.only(right: 400),
                child: const Text('Password:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),

              const SizedBox(height:10),

            Container(
              width: 500,
             child: const  TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                 // border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),

            const  SizedBox(height: 20.0),
              Container(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    // Add login logic here
                  },
                  child: const Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, // Background color
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

