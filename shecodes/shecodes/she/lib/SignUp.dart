import 'package:flutter/material.dart';
import 'package:she/Login.dart';
import 'package:she/NewAccount.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 90, 167, 116),
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
                    'assets/screen5img.png',
                    width: 306,
                    height: 240,
                  ),
                ),
              
                SizedBox(height: 30),

                const Text(
                  'Emergency Police \n Assistance',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Effortlessly connect with the nearby\n police station by simply tapping the ‘Call Police’ \n option in the app, ensuring \n prompt assistance in any emergency.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewAccount()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10),
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Already a member',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, color: Colors.pink),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10),
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
