import 'package:flutter/material.dart';

class textCard extends StatelessWidget {
  const textCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 200,
        child: Text("Welcome to Quik Green", style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          letterSpacing: 0,
        ),),
      ),
    );
  }
}