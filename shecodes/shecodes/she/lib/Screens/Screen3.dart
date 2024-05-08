import 'package:flutter/material.dart';
import 'package:she/Screens/Screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 94, 141, 179),
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
                    'assets/screen3img.png', // Replace 'your_image.png' with your image path
                    width: 306, // Adjust the width as needed
                    height: 240, // Adjust the height as needed
                  ),
                ),

               SizedBox(height: 30),

                const Text(
                  'Fake Calls',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 20),
                const Text(
                  'With our fake call feature, you can \n simulate an incoming call to discreetly \n exit uncomfortable situations or deter \n potential threats. Simply activate the \n feature, and your phone will ring as if \n receiving a genuine call',
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
                  MaterialPageRoute(builder: (context) => Screen4()), // Navigate to Screen2
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
