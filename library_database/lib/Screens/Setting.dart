import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_database/main.dart';
import '../Screens/Notifications.dart';
import '../Screens/Dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Setting extends StatefulWidget {
  final String email;

  Setting({required this.email});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int _selectedIndex = 2;

  TextEditingController _academicYearController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String memName = '';
  String memNo = '';
  String memGender = '';
  String grpName = '';
  String acy= '';
  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    String url = 'http://127.0.0.1/library/fetch_info.php';

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
            memName = data['data'][0]['MEM_NAME'];
            memNo = data['data'][0]['MEM_NO'];
            memGender = data['data'][0]['MEM_GENDER'];
            grpName = data['data'][0]['GRP_NAME'];
            acy = data['data'][0]['ACY'];
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

  Future<void> changePassword() async {
    String oldPassword = _oldPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword == confirmPassword) {
      String Url = 'http://127.0.0.1/library/change_password.php';
      try {
        var response = await http.post(
          Uri.parse(Url),
          body: {
            'email': widget.email, // Use email from widget
            'old_password': oldPassword,
            'new_password': newPassword,
          },
        );

        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          if (data['success']) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data['message'])),
            );
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
    }
  }

// Add this method inside the _SettingState class
  Future<void> changeAcademicYear() async {
    String newACY = _academicYearController.text.trim();

    String url = 'http://127.0.0.1/library/change_academic_year.php';
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'email': widget.email,
          'newACY': newACY,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['success']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );
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
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 40,
            ),
            onPressed: () {
              // Add your logic here for the account action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      // Conditionally load the female or male image
                      Expanded(
                        child:
                        Image.asset(
                          memGender == 'F' ? 'assets/female.png' : 'assets/male.png',
                          height: 100,
                          width: 100,
                        ),

                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            memName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(memNo),
                          Text(
                            memGender == 'F' ? 'Female' : 'Male',
                          ),
                          Text(grpName),
                          Text(acy),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Account",
                style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider() ,
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Update Academic Year"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Update Academic Year"),
                        content: TextField(
                          controller: _academicYearController,
                          decoration: InputDecoration(hintText: "Enter new academic year"),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Update"),
                            onPressed: () {
                              changeAcademicYear(); // Call the changeAcademicYear method
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              const Divider() ,
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Change Password"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Change Password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _oldPasswordController,
                              decoration: InputDecoration(hintText: "Old Password"),
                              obscureText: true,
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _newPasswordController,
                              decoration: InputDecoration(hintText: "New Password"),
                              obscureText: true,
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(hintText: "Confirm New Password"),
                              obscureText: true,
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Change"),
                            onPressed: () {
                              changePassword();
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider() ,
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()), // Replace with your login screen widget
                        (Route<dynamic> route) => false, // Removes all routes in the stack
                  );
                },
              ),
              const Divider() ,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard(email: widget.email)),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications(email: widget.email)),
              );
              break;
            case 2:

              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
