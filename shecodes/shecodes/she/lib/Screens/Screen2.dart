import "package:flutter/material.dart";
import 'package:she/Screens/Screen3.dart';



class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 147, 210),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top: 150, // Adjust the position as needed
                  left: 100, // Adjust the position as needed
                  child: Image.asset(
                    'assets/screen2img.png', // Replace 'your_image.png' with your image path
                    width: 306, // Adjust the width as needed
                    height: 240, // Adjust the height as needed
                  ),
                ),

              SizedBox(height: 30),

                const Text(
                  'Emergency call \n and Location sharing',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Activate the SOS button for \n immediate assistance. Connect \n  with emergency contacts and \n share your location \n  simultaneously for swift response.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
                     Positioned(
            bottom: 20,
            left: (MediaQuery.of(context).size.width - 100) / 2, // Center horizontally
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen3()), // Navigate to Screen2
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

