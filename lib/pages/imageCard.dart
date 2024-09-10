import 'package:flutter/material.dart';

class imageCard extends StatefulWidget {
  const imageCard({super.key});

  @override
  State<imageCard> createState() => _imageCardState();
}

class _imageCardState extends State<imageCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
              // height: Flexible,
              // width: 600,
              child: Image.asset('asset/st1.png'),
            )
            );
  }
   
}
