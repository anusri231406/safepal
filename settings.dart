import 'package:flutter/material.dart';
import 'package:safepal/view/profile.dart';

import 'history.dart';

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.system,
  ));
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  void editEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Email Address"),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter new email address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Add logic to save new email address
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void changePassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Change Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Enter current password"),
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Enter new password"),
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Confirm new password"),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Add logic to save new password
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
  List<bool> coloricon = [false, false, false];
  void tapicon(int indexc) {
    setState(() {
      coloricon[indexc] = !coloricon[indexc];
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: height * 0.3,
                  width: width * 0.8,
                  child: Image.asset(
                    'assets/settings safepal.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Gradient container for "ACCOUNTS"
              // Gradient container for ACCOUNTS label
              Container(
                padding: EdgeInsets.all(8),
                height: height * 0.05,
                width: width * 0.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFCAA1E2), Color(0xFFF9DCEE)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "ACCOUNTS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

// List items under ACCOUNTS section
              ListTile(
                title: Text("Edit email address"),
                leading: Icon(Icons.email,
                    color: Color.fromARGB(255, 230, 138, 247)),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 230, 138, 247)),
                onTap: editEmail,
              ),
              Divider(),
              ListTile(
                title: Text("Change password"),
                leading: Container(
                  // Adjust padding as needed
                  child: Image.asset(
                    'assets/password.jpeg',
                    width: 24, // Adjust width and height as needed
                    height: 24,
                    fit: BoxFit.contain, // Ensures the image fits well
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 230, 138, 247)),
                onTap: changePassword,
              ),
              Divider(),
              ListTile(
                title: Text("Connect device"),
                leading: Icon(Icons.device_unknown,
                    color: Color.fromARGB(255, 230, 138, 247)),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 230, 138, 247)),
                onTap: editEmail,
              ),
              SizedBox(height: 20),

// Gradient container for PREFERENCES label
              Container(
                padding: EdgeInsets.all(8.0),
                height: height * 0.05,
                width: width * 0.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFCAA1E2), Color(0xFFF9DCEE)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "PREFERENCES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

// Dark Mode switch under PREFERENCES section
              SwitchListTile(
                title: Text("Dark Mode"),
                secondary: Icon(Icons.dark_mode, color: Colors.black),
                value: isDarkMode,
                onChanged: toggleDarkMode,
              ),

              SizedBox(height: 30),
              // Gradient Log Out button
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Goes back to the front page
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFCAA1E2), Color(0xFFF9DCEE)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    tapicon(0);
                    //ontapscreen(0);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingsPage()));
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 40,
                    color: Color.fromARGB(255, 106, 51, 216),
                  )),
              SizedBox(width: 80),
              IconButton(
                  onPressed: () {
                    tapicon(1);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => historypagemy()));
                  },
                  icon: coloricon[1] == false
                      ? Icon(
                          Icons.history,
                          size: 40,
                          color: Color.fromARGB(255, 221, 103, 176),
                        )
                      : Icon(
                          Icons.history,
                          size: 40,
                          color: Color.fromARGB(255, 106, 51, 216),
                        )),
              SizedBox(width: 80),
              IconButton(
                  onPressed: () {
                    tapicon(2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  icon: coloricon[2] == false
                      ? Icon(
                          Icons.person,
                          size: 40,
                          color: Color.fromARGB(255, 221, 103, 176),
                        )
                      : Icon(
                          Icons.person,
                          size: 40,
                          color: Color.fromARGB(255, 106, 51, 216),
                        )),
            ],
          ),
        )
    );
  }
}
