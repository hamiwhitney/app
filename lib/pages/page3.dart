import 'package:flutter/material.dart';

class pgThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Image covering the top part of the screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5, // Adjust this value to cover more or less of the screen
              width: MediaQuery.of(context).size.width, // Ensure full width coverage
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                ),
                child: Stack(
                  children: [
                    // The image
                    Image.asset(
                      'asset/mod3.png', // Ensure the path is correct
                      fit: BoxFit.cover,
                      width: double.infinity, // Ensure it covers the width of the container
                      height: double.infinity,
                    ),
                    // Gradient overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 100, // Adjust the height as necessary for the gradient
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.white.withOpacity(1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Rest of the content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4, // Adjust this to position the content below the image
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
              
              
              child: Container(
                width: double.infinity, // Ensure full width coverage
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter,
                  colors: [ Colors.white.withOpacity(0.8), // Starting color (white with some opacity)
                   Colors.white.withOpacity(0.0),]
                  ),
                  
                  // color: const Color.fromARGB(255, 245, 245, 245), // Background color
                  
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 16),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter,
                  colors: [ Colors.white.withOpacity(0.8), // Starting color (white with some opacity)
                   Colors.white.withOpacity(0.0),]
                  ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Empower Your Voice",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        "Participate in polls, share your ideas, and contribute to your party's success.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
