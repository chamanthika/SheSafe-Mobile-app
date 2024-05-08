import 'package:flutter/material.dart';
import 'package:she/Screens/Screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top: 150,
                  left: 100,
                  child: Image.asset(
                    'assets/screen1img.png',
                    width: 306,
                    height: 240,
                  ),
                ),
               
               SizedBox(height: 30),

                const Text(
                  'Audio Recording',
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Activate audio recording for added \n security. Capture details discreetly \n during emergencies. Your safety \n matters, and having audio evidence can \n provide peace of mind.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // Positioned widget for the centered image
          Positioned(
            bottom: 20,
            left: (MediaQuery.of(context).size.width - 100) /
                2, // Center horizontally
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Screen2()), // Navigate to Screen2
                );
              },
              child: Image.asset(
                'assets/swiparrow.png',
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
