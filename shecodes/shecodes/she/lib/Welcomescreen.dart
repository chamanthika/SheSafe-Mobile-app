
//Done by -KTN DHARMADASA -index-24920

import 'package:flutter/material.dart';
import 'package:she/Screens/Screen1.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: const Text(
              'Step into a realm of \n confidence',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/she.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome to \n SheSafe',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the next page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Screen1()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Get started'),
          ),
        ],
      ),
    );
  }
}
