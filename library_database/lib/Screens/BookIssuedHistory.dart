import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookIssuedHistory extends StatefulWidget {
  final String email;

  BookIssuedHistory({required this.email});

  @override
  _BookIssuedHistoryState createState() => _BookIssuedHistoryState();
}

class _BookIssuedHistoryState extends State<BookIssuedHistory> {
  List<dynamic> bookHistory = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBookHistory();
  }

  Future<void> fetchBookHistory() async {
    String url = 'http://127.0.0.1/library/fetch_book_history.php';

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
            bookHistory = data['data'];
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
          'Book Issued History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: bookHistory.length,
        itemBuilder: (context, index) {
          final book = bookHistory[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: ListTile(
              title: Text(book['Title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Author: ${book['AUTHOR']}'),
                  Text('Issue Date: ${book['ISSUE_DATE']}'),
                  Text('Return Date: ${book['RETURN_DATE']}'),
                  Text('Status: ${book['STATUS']}'),
                  Text('Fine: ${book['FINE'] ?? 'NULL'}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
