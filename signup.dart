import 'package:flutter/material.dart';
import 'package:safepal/view/history.dart';
import 'package:safepal/view/signupotp.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Controllers for password and confirm password fields
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _signUp() {
    // Check if passwords match
    if (_passwordController.text == _confirmPasswordController.text) {
      // Navigate to the Home screen if passwords match
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpVerification()),
      );
    } else {
      // Show error message if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
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
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        backgroundColor: Color(0xFFCAA1E2),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height * 1,
          width: width * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFCAA1E2),
                Color(0xFFF9DCEE),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                // Asset image
                Container(
                  height: height * 0.3,
                  width: width * 0.8,
                  child: Image.asset(
                    'assets/cat.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Hi there!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                // Username field
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFB183C2),
                          Color(0xFFB183C2),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                      ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size:
                            30, // Placeholder color; won't be visible due to ShaderMask
                      ),
                    ),
                    hintText: 'Enter your email address',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: EdgeInsets.all(8.0), // Adjust padding as needed
                      child: Image.asset(
                        'assets/password.jpeg',
                        width: 22, // Adjust width and height as needed
                        height: 22,
                        fit: BoxFit.contain, // Ensures the image fits well
                      ),
                    ),
                    hintText: 'Enter your password',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color.fromARGB(255, 159, 24, 238),
                          Color(0xFFD7A2D2),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                      ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                      child: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Confirm Password field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: EdgeInsets.all(8.0), // Adjust padding as needed
                      child: Image.asset(
                        'assets/password.jpeg',
                        width: 22, // Adjust width and height as needed
                        height: 22,
                        fit: BoxFit.contain, // Ensures the image fits well
                      ),
                    ),
                    hintText: 'Re-enter your password',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            Color.fromARGB(255, 159, 24, 238),
                            Color(0xFFD7A2D2),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                        ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white, // Placeholder color
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 30),
                // Sign Up button
                GestureDetector(
                  onTap: _signUp, // Call the sign-up function
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFCAA1E2),
                          Color(0xFFD0A1DB),
                          Color(0xFFD7A2D2),
                        ],
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
