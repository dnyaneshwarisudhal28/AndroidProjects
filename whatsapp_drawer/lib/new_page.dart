import 'package:flutter/material.dart';


class App extends StatelessWidget {
  final String title;
  const App({Key? key, required this.title}) : super(key: key);
  // const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white70,
      appBar: AppBar(
        title:  Text(title),
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 22.0),
        leading: const Icon(Icons.person,color: Colors.white,size: 30),
        backgroundColor: const Color.fromRGBO(25, 43, 51, 10),
        actions: [
          IconButton(onPressed: () => {},
              icon: const Icon(Icons.videocam_sharp,color: Colors.white,)),
          IconButton(onPressed: () => {},
              icon: const Icon(Icons.call,color: Colors.white,)),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: const Color.fromRGBO(25, 43, 51, 10),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: ListView(
                      children: const [
                        ListTile(
                          title: Text('Media, links, and docs', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          title: Text('Search', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          title: Text('Disappearing messages', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          title: Text('Wallpaper', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          title: Text('More', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
          ),


        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: const  EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              prefixIcon: const Icon(Icons.emoji_emotions_sharp),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () =>{},
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      icon: const Icon(Icons.camera_alt_sharp)),
                  IconButton(onPressed: () =>{},
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      icon: const Icon(Icons.attach_file_sharp)),
                  IconButton(onPressed: () =>{},
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      icon: const Icon(Icons.mic,size: 30.0,)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
