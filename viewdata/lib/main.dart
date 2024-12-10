import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Map<String, String>>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost/insertdata/show.php'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<Map<String, String>> formattedData = [];

      for (var i = 0; i < jsonData.length; i++) {
        formattedData.add({
          'name': jsonData[i]['name'],
          'email': jsonData[i]['email'],
          'mobile': jsonData[i]['mobile']
        });
      }
      return formattedData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Fetch Data Example'),
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Set the background color of the table
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.lightBlueAccent),
                    dataRowHeight: 50,
                    headingRowHeight: 60,
                    dividerThickness: 2,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Name'),
                        tooltip: 'Name',
                      ),
                      DataColumn(
                        label: Text('Email'),
                        tooltip: 'Email',
                      ),
                      DataColumn(
                        label: Text('Mobile'),
                        tooltip: 'Mobile',
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      snapshot.data!.length,
                          (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(snapshot.data![index]['name']!)),
                          DataCell(Text(snapshot.data![index]['email']!)),
                          DataCell(Text(snapshot.data![index]['mobile']!)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}