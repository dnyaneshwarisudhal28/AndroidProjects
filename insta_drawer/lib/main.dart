import 'package:flutter/material.dart';

void main() {
  runApp(const MyInsta());
}

class MyInsta extends StatelessWidget {
  final appTitle = 'Insta Drawer';
  const MyInsta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Insta(title: appTitle),
    );
  }
}

class Insta extends StatelessWidget {
  final String title;
  const Insta({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("dnyaneshwari.28", style: TextStyle(color: Colors.white,fontSize: 20.0)),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on_sharp,color: Colors.white,)),
              Tab(icon: Icon(Icons.video_collection_outlined,color: Colors.white,)),
              Tab(icon: Icon(Icons.perm_contact_cal_outlined,color: Colors.white,)),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.redAccent,
            indicatorColor: Colors.grey,
            labelStyle: (TextStyle(fontSize: 18.0,)),

          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.lock_outline, size: 20.0),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.my_library_add_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
                onPressed: ()  {
                  showModalBottomSheet(
                    backgroundColor: Colors.black,
                    context: context,
                    builder: (BuildContext context){
                      return SizedBox(
                        height: 500,
                        child: ListView(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.settings, color: Colors.white),
                              title: const Text(
                                "settings and privacy",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.stacked_line_chart_outlined, color: Colors.white),
                              title: const Text(
                                "Yours activity",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.update_sharp, color: Colors.white),
                              title: const Text(
                                "Archive",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.bookmark_border_outlined, color: Colors.white),
                              title: const Text(
                                "Saved",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.verified_outlined, color: Colors.white),
                              title: const Text(
                                "Meta Verified",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(color: Colors.white, Icons.payment_rounded),
                              title: const Text(
                                "Orders and Payments",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.people_outline, color: Colors.white),
                              title: const Text(
                                "Supervision",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.qr_code_rounded, color: Colors.white),
                              title: const Text(
                                "QR code",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.star_border, color: Colors.white),
                              title: const Text(
                                "Favourites",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.stars_sharp, color: Colors.white),
                              title: const Text(
                                "Close friends",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.menu))
          ],
        ),
        // body: const TabBarView(
        //   children: [
        //     Icon(Icons.message_outlined),
        //     Icon(Icons.video_call_outlined),
        //     Icon(Icons.call),
        //   ],
        // ),
        // drawer: Drawer(
        //   backgroundColor: Colors.black,
        //   child: ListView(
        //     children: [
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.settings, color: Colors.white),
        //         title: const Text(
        //           "settings and privacy",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.stacked_line_chart_outlined, color: Colors.white),
        //         title: const Text(
        //           "Yours activity",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.update_sharp, color: Colors.white),
        //         title: const Text(
        //           "Archive",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.bookmark_border_outlined, color: Colors.white),
        //         title: const Text(
        //           "Saved",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.verified_outlined, color: Colors.white),
        //         title: const Text(
        //           "Meta Verified",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(color: Colors.white, Icons.payment_rounded),
        //         title: const Text(
        //           "Orders and Payments",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.people_outline, color: Colors.white),
        //         title: const Text(
        //           "Supervision",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.qr_code_rounded, color: Colors.white),
        //         title: const Text(
        //           "QR code",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.star_border, color: Colors.white),
        //         title: const Text(
        //           "Favourites",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         leading: const Icon(Icons.stars_sharp, color: Colors.white),
        //         title: const Text(
        //           "Close friends",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
