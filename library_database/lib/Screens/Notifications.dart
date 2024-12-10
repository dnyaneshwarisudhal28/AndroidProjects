import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'notification_service.dart';
import '../Screens/setting.dart';
import '../Screens/Dashboard.dart';


class Notifications extends StatefulWidget {
  final String email;

  Notifications({required this.email});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _selectedIndex = 1;
  late NotificationService _notificationService;
  bool _isScheduled = false;
  List<String> notificationList = [];
  @override
  void initState() {
    super.initState();
    _notificationService = NotificationService();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    await _notificationService.initialize();
    if (!_isScheduled) {
      _isScheduled = true;
      _scheduleDueBookNotifications();
    }
    _notificationService.showTestNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(90, 19, 175, 239),
        title: Text(
          'Remainders',
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
                MaterialPageRoute(builder: (context) => Setting(email: widget.email)),
              );
            },
          ),
        ],
      ),
      body: //Center(
      //   child: Text('Notifications Screen'),
      // ),
      ListView.builder(
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(notificationList[index]),
            ),
          );
        },
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard(email: widget.email)),
              );
              break;
            case 1:
            // No need to navigate to Notifications again
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting(email: widget.email)),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  Future<void> _scheduleDueBookNotifications() async {
    String url = 'http://127.0.0.1/library/fetchnotification.php'; // Update with your actual URL

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
          List<dynamic> booksWithFines = data['data'];
          for (var book in booksWithFines) {
            DateTime dueDate = DateFormat('dd-MM-yyyy').parse(book['DUE_DATE']);
            print(dueDate);
            print("hi");
            print(book['Title']);
            DateTime currentDate = DateTime.now();
            Duration difference = dueDate.difference(currentDate);
            print(difference.inDays);
            // Check if due date is 3 days ahead and fine is not collected
            if (difference.inDays <= 3 && difference.inDays >= 0
            ) {

              DateTime notificationDate = dueDate.subtract(Duration(days: 3));
              print(notificationDate);

              if (notificationDate.isBefore(DateTime.now())) {

                _addNotificationToList(
                  'Your book "${book['Title']}" is due in 3 days or less than 3 days. Please return it to avoid fines.',
                );

                print("Executed1");
                await _notificationService.scheduleNotification(
                  title: 'Return Book Reminder',
                  body: 'Your book "${book['Title']}" is due in 3 days or less than 3 days. Please return it to avoid fines.',
                  // scheduledDate: notificationDate,
                );
              }
              print("object");
            }

            // Check if book is already due and fine is not collected
            if (book['FINE_DUE'] != book['FINE_COLLECTED']) {
              print("Executed2");
              // Schedule notifications every day until book is returned
              for (int i = 0; i <=0 /*difference.inDays.abs()*/; i++) {
                DateTime notificationDate = dueDate.add(Duration(days: i));
                if (notificationDate.isBefore(DateTime.now())) {

                  _addNotificationToList(
                    'Your book "${book['Title']}" fine is pending.',
                  );

                  await _notificationService.scheduleNotification(
                    title: 'Return Book Reminder',
                    body: 'Your book "${book['Title']}" has fine "${book['FINE_DUE']}". Please return it to avoid fines.',
                    // scheduledDate: notificationDate,
                  );
                }
              }
            }

          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Notifications scheduled for due books')),
          );
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _addNotificationToList(String notification) {
    setState(() {
      notificationList.add(notification);
    });
  }

}
