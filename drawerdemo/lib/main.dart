import 'package:flutter/material.dart';

void main(){
  runApp(const MyDrawer());
}
class MyDrawer extends StatelessWidget{
  //final appTitle = 'Demo Drawer';
  const MyDrawer({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter AppBar"),
            backgroundColor: Colors.pinkAccent,
          ),
          body: Center(
            child: Builder(
              builder: (context) => ElevatedButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Text('Open Drawer')

              ),
            ),
          ),
          drawer: Drawer(
            //backgroundColor: Colors.black,
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.purple),
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      "Dnyaneshwari Sudhal",
                      style: TextStyle(fontSize: 18),
                    ),
                    decoration: BoxDecoration(color: Colors.purpleAccent),
                    accountEmail: Text("dks28@gmail.com"),
                    currentAccountPictureSize: Size.square(40),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Text(
                        "D",
                        style: TextStyle(fontSize: 25.0,color:Colors.black87),
                      ),
                    ),
                  ),
                ),

                ListTile(
                  title: const Text('Subject1'),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  title: const Text('Subject2'),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Subject3'),
                  onTap: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}