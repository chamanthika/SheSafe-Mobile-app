import 'package:flutter/material.dart';
import 'package:she/SignUp.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 79, 116),
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
                    'assets/screen4img.png',
                    width: 306,
                    height: 240,
                  ),
                ),

                SizedBox(height: 30),

                const Text(
                  'Make a Complaint',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0),
                ),

                const SizedBox(height: 20),
                const Text(
                  ' Stand up for women’s rights by lodging \n complaints directly to the Ministry of \n Women and Child Affairs through our \n app. Your courageous actions contribute \n to the advancement of \n protection of women',
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
                  MaterialPageRoute(builder: (context) => SignUp()), // Navigate to Screen2
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
