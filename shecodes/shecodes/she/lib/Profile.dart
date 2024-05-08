import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:she/Logoutconfir.dart';
import 'package:she/RecorList.dart';
import 'package:she/Updatedetails.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Updatedetails()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.mic),
                    title: const Text('Audio Recordings'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecorList()),
                      );
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
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Logoutconfir()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
