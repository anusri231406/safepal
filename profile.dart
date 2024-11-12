import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'history.dart';
import 'settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Map<String, String> _selectedOptions = {
    "Gender": "Not selected",
    "Birthday": "Not selected",
    "Height": "Not selected",
    "Weight": "Not selected",
    "Blood Group": "Not selected",
  };

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

    void _showPredefinedOptionsDialog(
        BuildContext context, String title, List<String> options) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10.0, // Horizontal spacing between items
                  runSpacing: 5.0, // Vertical spacing between lines
                  children: options.map((option) {
                    return ChoiceChip(
                      label: Text(option),
                      selected: _selectedOptions[title] == option,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedOptions[title] =
                              selected ? option : "Not selected";
                        });
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      );
    }

    void _showHeightInputDialog(BuildContext context, String title) {
      TextEditingController feetController = TextEditingController();
      TextEditingController inchesController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter Height"),
            content: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: feetController,
                    decoration: InputDecoration(labelText: "Feet"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: inchesController,
                    decoration: InputDecoration(labelText: "Inches"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    String height =
                        "${feetController.text} ft ${inchesController.text} in";
                    _selectedOptions[title] = height;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Save"),
              ),
            ],
          );
        },
      );
    }

    void _showWeightInputDialog(BuildContext context, String title) {
      TextEditingController weightController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter Weight (kg)"),
            content: TextField(
              controller: weightController,
              decoration: InputDecoration(hintText: "Weight in kg"),
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedOptions[title] = "${weightController.text} kg";
                  });
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Save"),
              ),
            ],
          );
        },
      );
    }

    void _showTextInputDialog(BuildContext context, String title) {
      TextEditingController controller = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter $title"),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Enter $title"),
              keyboardType: TextInputType.text,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedOptions[title] = controller.text;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Save"),
              ),
            ],
          );
        },
      );
    }

//birthdate date choosing dialouge box
    void _showDatePickerDialog(BuildContext context, String title) async {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (selectedDate != null) {
        setState(() {
          // Format the date as dd/MM/yyyy
          _selectedOptions[title] =
              DateFormat('dd/MM/yyyy').format(selectedDate);
        });
      }
    }

    Widget optionBox(String title, BuildContext context,
        [List<String>? predefinedOptions]) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 183, 133, 230),
                Color.fromARGB(197, 222, 142, 244),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              _selectedOptions[title] ?? "Not selected",
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              if (title == "Birthday") {
                _showDatePickerDialog(context, title);
              } else if (predefinedOptions != null) {
                _showPredefinedOptionsDialog(context, title, predefinedOptions);
              } else if (title == "Height") {
                _showHeightInputDialog(context, title);
              } else if (title == "Weight") {
                _showWeightInputDialog(context, title);
              } else {
                _showTextInputDialog(context, title);
              }
            },
          ),
        ),
      );
    }

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
            'Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              //profile
              Container(
                height: height * 0.03,
                width: width * 1,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 45,
                    ),
                    child: Text('Please  fill in your personal information',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),

              //boxes
              Container(
                height: height * 0.6,
                width: width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      optionBox("Gender", context, ["Male", "Female", "Other"]),
                      optionBox("Birthday", context),
                      optionBox("Height", context),
                      optionBox("Weight", context),
                      optionBox("Blood Group", context,
                          ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]),
                    ],
                  ),
                ),
              ),
            ]),
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
                icon: coloricon[0] == false
                    ? Icon(
                        Icons.settings,
                        size: 40,
                        color: Color.fromARGB(255, 221, 103, 176),
                      )
                    : Icon(
                        Icons.settings,
                        size: 40,
                        color: Color.fromARGB(255, 106, 51, 216),
                      )),
            SizedBox(width: 80),
            IconButton(
                onPressed: () {
                  tapicon(1);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => historypagemy()));
                },
                icon: coloricon[2] == false
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
                icon: Icon(
                  Icons.person,
                  size: 40,
                  color: Color.fromARGB(255, 106, 51, 216),
                )),
          ],
        ),
      ),
        );
  }
}
