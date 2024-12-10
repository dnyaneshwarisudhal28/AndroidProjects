import 'package:flutter/material.dart';

class PendingRequest extends StatefulWidget {
  @override
  PendingRequestState createState() => PendingRequestState();
}

class PendingRequestState extends State<PendingRequest> {
  List<String> papers = ['Paper 1 (Pending)', 'Paper 2 (Approved)', 'Paper 3 (Pending)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(90, 19, 175, 239),
        title: Text('Research Paper Requests',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(

        itemCount: papers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(papers[index]),
              // You can customize the ListTile as needed
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddPaperDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  void _showAddPaperDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController idController = TextEditingController();

    showDialog(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Add Research Paper'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Research Paper Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'Research Paper ID'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  papers.add('${nameController.text} (${idController.text}) (Pending)');
                  Navigator.pop(context);
                });
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
