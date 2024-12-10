import 'package:flutter/material.dart';
import 'package:whatsapp_drawer/new_page.dart';

void main() {
  runApp(const Whatsapp());
}

class Whatsapp extends StatelessWidget {
  final appTitle = "Whatsapp drawer";

  const Whatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyWhatsapp(title: appTitle),
    );
  }
}

class MyWhatsapp extends StatelessWidget {
  final String title;

  const MyWhatsapp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            ListView(
              children: [
                ListTile(
                  trailing: const Icon(Icons.person_pin),
                  leading: const Icon(Icons.person_rounded),
                  title: const Text('Dnyaneshwari'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const App(title: "Dnyaneshwari")));
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title: const Text('Aai'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const App(title: "Aai")));
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title: const Text('Baba'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const App(title: "Baba")));
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title: const Text('Keshav'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const App(title: "Keshav")));
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title: const Text('Shruti'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const App(title: "Shruti")));
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.groups),
                  title: const Text('Gharkul'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const App(title: "Gharkul")));
                  },
                ),
                const Divider(),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.circle_outlined,size: 40,), //report_outlined for spam
                  title: Text('Aai'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.circle_outlined,size: 40,), //report_outlined for spam
                  title: Text('Baba'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.circle_outlined,color: Colors.green,size: 40,), //report_outlined for spam
                  title: Text('Keshav'),
                ),
                Divider(),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.groups),
                  title: Text('WLUG Updates'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.groups),
                  title: Text('WLUG Technotweet'),
                ),
                Divider(),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.missed_video_call_rounded,color: Colors.red,size: 40.0,),
                  title: Text('Shruti'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.videocam_sharp,color: Colors.green,size: 40.0,),
                  title: Text('Gharkul'),
                ),
                Divider(),
              ],
            ),
          ],
        ),
        appBar: AppBar(

          title: const Text('WhatsApp'),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                text: 'Chats',
              ),
              Tab(
                icon: Icon(
                  Icons.update,
                  color: Colors.white,
                ),
                text: 'Updates',
              ),
              Tab(
                icon: Icon(
                  Icons.groups_3_outlined,
                  color: Colors.white,
                ),
                text: 'Communities',
              ),
              Tab(
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                text: 'Calls',
              ),
            ],
            labelColor: Colors.white,
            indicatorColor: Colors.white,
          ),
        ),
        drawer: Container(
          //  width: MediaQuery.of(context).size.width * 1.0,
          margin: const EdgeInsets.only(
              top: 70.0, bottom: 410.0, right: 00.0, left: 10.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0)),
            child: Drawer(
              width: 200.0,
              backgroundColor: const Color.fromRGBO(25, 43, 51, 10),
              child: ListView(
                children: [
                  ListTile(
                    title: const Text(
                      'New group',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'New broadcast',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Linked devices',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Starred messages',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Payments',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
