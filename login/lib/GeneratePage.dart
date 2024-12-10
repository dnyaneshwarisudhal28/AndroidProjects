import 'package:flutter/material.dart';
//androidID: com.demo.demoapp
class Generator extends StatelessWidget {
  const Generator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const  Text("Flutter Development",
          style: TextStyle(fontFamily: 'Montserrat-Medium',fontWeight: FontWeight.bold,fontSize: 24.0),),
      ),

      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            ListTile(
              title: const Text("Update profile"),
              leading: const Icon(Icons.person),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const  Divider(),
            ListTile(
              title: const Text("Change password"),
              leading: const Icon(Icons.password),
              onTap: (){
                Navigator.pop(context);
              },
            ),
           const  Divider(),
            ListTile(
              title: const Text("Log out"),
              leading: const Icon(Icons.logout),
              onTap: (){
              //  Navigator.push(context,MaterialPageRoute(builder:(context)=>const Login()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out!'), // Your message here
                  ),
                );
              },
            ),
            const  Divider(),
          ],
        ),
      ),
      body: SingleChildScrollView(
       child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Full Name:',
                style: TextStyle(fontSize: 20.0, fontFamily: 'times new roman'),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Enter college name:',
                style: TextStyle(fontSize: 20.0, fontFamily: 'times new roman'),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'College Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Enter Email:',
                style: TextStyle(fontSize: 20.0, fontFamily: 'times new roman'),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                // obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Enter Date of Birth:',
                style: TextStyle(fontSize: 20.0, fontFamily: 'times new roman'),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                //  obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50.0, // Set your desired height
                  width: 150.0, // Set your desired width
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Submitted sucessfully..!!'), // Your message here
                        ),
                      );// Add logic to handle form submission
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text('Submit',
                      style: TextStyle(fontSize: 20.0,color: Colors.white),),
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
