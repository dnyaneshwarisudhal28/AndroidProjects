// Add the necessary imports
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      print("Token: $token");
      // Save the token to the database to associate it with the student
      // This step would usually be done after the user logs in
      saveStudentTokenToDatabase(token);
    });
    // Set up a listener for incoming messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received notification: ${message.notification!.body}");
      // Handle the incoming message, e.g., show a local notification
    });
  }

  void saveStudentTokenToDatabase(String token) {
    DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
    String studentId = "123"; // Replace with the actual student ID
    databaseRef.child('students').child(studentId).set({
      'token': token,
    });
  }

  void sendNotificationToStudent(String studentToken) async {
    await FirebaseMessaging.instance.sendMessage(
      RemoteMessage(
        data: {
          'title': 'Library Book Return Reminder',
          'body': 'Your book is due in 3 days. Please return it to avoid late fees.',
        },
        token: studentToken,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library App'),
      ),
      body: Center(
        child: Text('Library App Content'),
      ),
    );
  }
}
