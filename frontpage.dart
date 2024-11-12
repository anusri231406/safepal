import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: height * 1,
          width: width * 1,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: height * 0.2,
                width: width * 1,
                color: Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(
                      width: 136,
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 60),
                      child: GradientText(
                        "Safepal",
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFF7D28F4), // Replace with your color
                            Color(0xFFC536B7),
                            Color(0xFF620FD6),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: height * 0.26,
                width: width * 0.76,
                child: Image.asset(
                  'assets/Safepal.png',
                  height: 100,
                  fit: BoxFit.cover,
                ),

                //color: Colors.black,
                decoration: BoxDecoration(
                  color: Colors.white,
                  //image: image.asset
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: height * 0.2,
                width: width * 1,
                color: Colors.transparent,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginUser(),
                            ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        height: height * 0.06,
                        width: width * 0.7,
                        //color: Colors.black,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(''), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFCAA1E2),
                                Color(0xFFD0A1DB),
                                Color(0xFFD7A2D2),
                              ]),
                          //color: Colors.blueAccent
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Sign-Up',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        height: height * 0.06,
                        width: width * 0.7,
                        //color: Colors.black,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage('')),
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFCAA1E2),
                                  Color(0xFFD0A1DB),
                                  Color(0xFFD7A2D2),
                                ])
                            //color: Colors.blueAccent
                            ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//class gradient
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  GradientText(this.text, {required this.gradient, required this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
