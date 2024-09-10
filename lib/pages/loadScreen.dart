import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splash/pages/splashScreen.dart';

class loadScreen extends StatefulWidget {
  const loadScreen({super.key});

  @override
  State<loadScreen> createState() => _loadScreenState();
}

class _loadScreenState extends State<loadScreen> {
  bool _showSplashScreen = false;

  @override
  void initState() {
    super.initState();

    // Set a timer to switch to the splash screen after 5 seconds
    Timer(Duration(seconds: 5), () {
      setState(() {
        _showSplashScreen = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009156),
      body: AnimatedSwitcher(
        duration: Duration(seconds: 1), // Duration of the crossfade
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _showSplashScreen ? SplashScreen() : _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return Center(
      child: LottieBuilder.asset('asset/quik.json'),
    );
  }
}