import 'package:flutter/material.dart';
import 'package:splash/pages/home.dart';
import 'package:splash/pages/intro.dart';
import 'package:splash/pages/loadScreen.dart';
// import 'package:splash/pages/loadScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState(
  // ) {
  //   // TODO: implement initState
  //   super.initState();
  //   loadScreen();
  
  // }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loadScreen()
    );
  }
}