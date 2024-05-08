import 'package:flutter/material.dart';
import 'package:she/homepage.dart';
import 'callpolice.dart'; // Import callpolice.dart

class Fakecall extends StatelessWidget {
  const Fakecall({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[50], // Set screen color to light pink
        body: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 70), // Adjust as needed to move the image and text down
                  Image.asset(
                    'assets/father.png',
                    height: 120,
                    width: 120,
                  ),
                  SizedBox(height: 20), // Add space between the image and the text
                  Text(
                    'Incoming call...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10), // Add space between the text and the additional text
                  Text(
                    'DAD',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 70, // Adjusted value to move slightly up
              left: 40,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()), // Navigate to callpolice.dart
                  );
                },
                child: Image.asset(
                  'assets/endcall2.png', // Adjust path to your image
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            Positioned(
              bottom: 70, // Adjusted value to move slightly up
              right: 40,
              child: Image.asset(
                'assets/answer.png', 
                height: 80,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
