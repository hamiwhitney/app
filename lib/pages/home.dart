import 'package:flutter/material.dart';
import 'package:splash/pages/imageCard.dart';
import '/pages/textCard.dart';

class home extends StatelessWidget {
  const home({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: 
          Column(
            children: <Widget>[
              Container(
                height: 550,
                child:  imageCard(),
                ),
                // Expanded(child: textCard(),)        
            ],
        ),
       ), 
      ));
  }
}