import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash/pages/page1.dart';
import 'package:splash/pages/page2.dart';
import 'package:splash/pages/page3.dart';
import 'package:splash/pages/signup.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Timer to switch pages every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % 3;  // Loop through the pages
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();  // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(seconds: 0), // Duration of the crossfade
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: _buildPageContent(_currentPage),
            ),
          ),
          _buildPageIndicator(),  // Place the indicator here
          // Keeping the Register button static
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),);// Handle registration or navigation
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    backgroundColor: const Color(0xFF009156),
                  ),
                  child: Text( 'Register',
                  style: TextStyle(fontSize: 18, color: Colors.white, height: 3),
                  ),
                ),
                SizedBox(height: 24),
                // Footer Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        // Handle login navigation
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.only(left:32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
          // Align to the start (left)
        children: [
          SizedBox(width: 16.0),  // Add some padding on the left
          _indicatorDot(isActive: _currentPage == 0),
          _indicatorDot(isActive: _currentPage == 1),
          _indicatorDot(isActive: _currentPage == 2),
        ],
      ),
    );
  }

  Widget _indicatorDot({required bool isActive}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 12.0 : 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }

  Widget _buildPageContent(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return pgOne();  // Replace with your Page1 widget
      case 1:
        return pgTwo();  // Replace with your Page2 widget
      case 2:
        return pgThree();  // Replace with your Page3 widget
      default:
        return pgOne();  // Default to Page1 in case of any error
    }
  }
}
