import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();


  //update data
  Future<void> updateData() async {
    // Your PHP server URL to update data
    var url = Uri.parse('http://127.0.0.1/insertdata/update.php');

    try {
      var response = await http.post(
        url,
        body: {
          'name': name.text,
          'email': email.text,
          'mobile': mobile.text,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data updated successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        print('Failed to update data. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred while updating data: $e');
    }
  }


// delete data
  Future<void> _deleteData() async {
    // Your PHP server URL to delete data
    var url = Uri.parse('http://127.0.0.1/insertdata/delete.php');

    try {
      var response = await http.post(
        url,
        body: {
          'name': name.text,
          'email': email.text,
          'mobile': mobile.text,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data deleted successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        print('Failed to delete data. Error: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Exception occurred while deleting data: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update & Delete Data'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: mobile,
              decoration: const InputDecoration(
                labelText: 'Mobile',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: updateData,
              child: const Text('Update Data'),
            ),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _deleteData,
              child: const Text('Delete Data'),
            ),
          ],
        ),
      ),
    );
  }
}
