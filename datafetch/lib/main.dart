import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Employee {
  final String username;
  final String password;

  Employee({required this.username, required this.password});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      username: json['username'],
      password: json['password'],
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Employee>> futureEmployees;

  @override
  void initState() {
    super.initState();
    futureEmployees = fetchEmployees();
  }

  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(Uri.parse('http://localhost/insertdata/fetch.php'));


    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((employee) => Employee.fromJson(employee)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee List',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Employee List'),
        ),
        body: Center(
          child: FutureBuilder<List<Employee>>(
            future: futureEmployees,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].username),
                      subtitle: Text(snapshot.data![index].password),
                    );
                  },
                );
              } else {
                return const Text("No data available");
              }
            },
          ),
        ),
      ),
    );
  }
}