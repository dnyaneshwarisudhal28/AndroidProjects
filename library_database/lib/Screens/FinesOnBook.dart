import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FinesOnBook extends StatefulWidget {
  final String email;

  FinesOnBook({required this.email});

  @override
  _FinesOnBookState createState() => _FinesOnBookState();
}

class _FinesOnBookState extends State<FinesOnBook> {
  List<dynamic> booksWithFines = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    String url = 'http://127.0.0.1/library/fetch_pending_fines.php';

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
            booksWithFines = data['data'];
            isLoading = false;
          });
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
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(90, 19, 175, 239),
        title: Text('Fines on the Book', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: booksWithFines.length,
        itemBuilder: (context, index) {
          final book = booksWithFines[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: ListTile(
              title: Text(book['Title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Author: ${book['AUTHOR']}'),
                  Text('Fine Due: ${book['FINE_DUE']}'),
                  Text('Fine Collected: ${book['FINE_COLLECTED']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
