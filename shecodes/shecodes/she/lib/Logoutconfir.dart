import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:she/Login.dart';
import 'package:she/globals.dart';
import 'package:she/homepage.dart';

class Logoutconfir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background content
          Drawer(
            child: Container(
              color: Colors.pink, // Set background color to pink
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const SizedBox(height: 20),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/user1.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    title: const Text(
                      'Seli Safe\n+94 768918520',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('My Account'),
                    onTap: () {
                      // Navigate to My Account page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.mic),
                    title: const Text('Audio Recordings'),
                    onTap: () {
                      // Navigate to Audio Recordings page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.policy),
                    title: const Text('Safety Policy'),
                    onTap: () {
                      // Navigate to Safety Policy page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help Center'),
                    onTap: () {
                      // Navigate to Help Center page
                    },
                  ),
                  const SizedBox(height: 150),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          // Blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Notification box
          Center(
            child: AlertDialog(
              title: const Text('Confirm Logout!'),
              content: const Text('Are you sure you want to Log out?'),
              actions: [
                TextButton(
                  onPressed: () {
                    // Perform cancel action
                    logout_cancel_action(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Perform OK action
                    logout_action(context);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void logout_action(BuildContext context) {
    logged_user = "";
    Future.delayed(Duration(milliseconds: 500), () {
      // Navigate to the login page and remove all other routes from the navigation stack
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false,
      );
    });
  }

  void logout_cancel_action(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      // Navigate to the login page and remove all other routes from the navigation stack
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => homepage()),
        (Route<dynamic> route) => false,
      );
    });
  }
}
