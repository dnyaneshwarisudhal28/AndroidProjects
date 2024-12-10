import 'package:flutter/material.dart';
import '../Screens/BookIssuedHistory.dart';
import '../Screens/Notifications.dart';
import '../Screens/Setting.dart';
import '../Screens/PendingRequest.dart';
import '../Screens/FinesOnBook.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard extends StatefulWidget {
  final String email; // Required email parameter

  Dashboard({required this.email}); // Constructor to receive email

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<dynamic> currentbook = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCurrentBook();
  }

  Future<void> fetchCurrentBook() async {
    String url = 'http://127.0.0.1/library/fetch_current_issued_book.php';

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'email': widget.email,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['success']) {
          setState(() {
            currentbook = [data['data']]; // Wrap data['data'] in a List
            isLoading = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(90, 19, 175, 239),
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 40,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Setting(email: widget.email)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/dashboard.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Issued Book:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    isLoading
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('\t No current issued book'),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      itemCount: currentbook.length,
                      itemBuilder: (context, index) {
                        final book = currentbook[index];
                        return ListTile(
                          title: Text(book['Title']),
                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text('Author: ${book['AUTHOR']}'),
                              Text(
                                  'Issue Date: ${book['ISSUE_DATE']}'),
                              Text('Due Date: ${book['DUE_DATE']}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tracking:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.history), // Book issued history
                      title: Text('Book Issued History'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookIssuedHistory(email: widget.email)),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.money), // Pending Book Fine
                      title: Text('Pending Book Fine'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FinesOnBook(email: widget.email)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Remainder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Current selected index
        selectedItemColor: Colors.blueAccent, // Color for selected tab
        unselectedItemColor: Colors.grey, // Color for unselected tab
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update selected index
          });
          switch (index) {
            case 0:
            // No need to navigate to Dashboard again
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Notifications(email: widget.email)),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Setting(email: widget.email)),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
