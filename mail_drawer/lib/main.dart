import 'package:flutter/material.dart';

void main(){
  runApp(const MyDrawer());
}
class MyDrawer extends StatelessWidget{
  final appTitle = 'Gmail drawer';
  const MyDrawer({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Email AppBar"),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.redAccent,
            actions: [
              Container (margin: const EdgeInsets.all(20.0),),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search in emails',
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.only(top: 10.0,left: 20.0,),
                    filled: true,
                    fillColor: Colors.black26,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.red),),
                  ),
                ),
              ),),

            ],
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
            backgroundColor: Colors.black54,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Gmail',
                    style: TextStyle(color: Colors.white,fontSize: 24.0),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                const Divider(color: Colors.white,),
                ListTile(
                  leading: const Icon(Icons.photo_library_sharp,color: Colors.white,),
                  title: const Text('All inboxes',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                const Divider(color: Colors.white,),

                ListTile(
                  leading: const Icon(Icons.photo_outlined,color: Colors.white,),
                  title: const Text('Primary',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.bookmark_add_rounded,color: Colors.white,),
                  title: const Text('Promotions',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.people_alt_outlined,color: Colors.white,),
                  title: const Text('Social',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  // leading: const Icon(Icons.photo_library_sharp,color: Colors.white,),
                  title: const Text('All labels',
                    style: TextStyle(color: Colors.white,fontSize: 14),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.star_border,color: Colors.white,),
                  title: const Text('Starred',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.schedule_outlined,color: Colors.white,),
                  title: const Text('Snoozed',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.label_important_outline_sharp,color: Colors.white,),
                  title: const Text('Important',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.send,color: Colors.white,),
                  title: const Text('Sent',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.schedule_send_outlined,color: Colors.white,),
                  title: const Text('Scheduled',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.outbox_outlined,color: Colors.white,),
                  title: const Text('Outbox',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.mail_outline_outlined,color: Colors.white,),
                  title: const Text('All mails',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.report_gmailerrorred_sharp,color: Colors.white,),
                  title: const Text('Spam',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.delete_outline,color: Colors.white,),
                  title: const Text('Bin',
                    style: TextStyle(color: Colors.white,),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}