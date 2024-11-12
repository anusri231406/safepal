import 'package:flutter/material.dart';

import 'package:safepal/view/profile.dart';
import 'package:safepal/view/settings.dart';

class historypagemy extends StatefulWidget {
  const historypagemy({super.key});

  @override
  State<historypagemy> createState() => _historypagemyState();
}

class _historypagemyState extends State<historypagemy> {
  List<bool> coloricon = [false, false, false];
  List<bool> ontap = [false, false, false];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    void tapicon(int indexc) {
      setState(() {
        coloricon[indexc] = !coloricon[indexc];
      });
    }

    void ontapscreen(int index) {
      ontap[index] = !ontap[index];
      setState(() {});
    }

    Widget boxpf(String iconbig, String texttype) {
      return Stack(children: [
        Container(
          height: height * 0.25,
          width: width * 0.65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 241, 142, 208),
                    const Color.fromARGB(255, 198, 138, 244)
                  ])),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 7, top: 8, right: 10, bottom: 10),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: height * 0.23,
                width: width * 0.62,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 50, top: 30),
                  child: Column(
                    children: [
                      Text('$texttype'),
                      SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Container(
                            height: height * 0.03,
                            width: width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFCAA1E2), Color(0xFFD0A1DB),
                                      Color(0xFFD7A2D2),
                                      //Color(0xFFF9DCEE),
                                    ])),
                            child: Center(
                              child: Text(
                                "Tap to see more",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 9),
                              ),
                            )),
                      )
                    ],
                  ),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              ),
              Image.asset(
                '$iconbig',
                height: 100,
              )
            ],
          ),
        )
      ]);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('MY Today History'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                boxpf('assets/emergency contact.png', 'Emergency contacts'),
                SizedBox(
                  height: 25,
                ),
                boxpf('assets/voice-message.png', 'Today voice recording'),
                SizedBox(
                  height: 25,
                ),
                boxpf('assets/location.png', 'Todays location')
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => historypagemy()));
                  },
                  icon: Icon(
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
        ));
  }
}
