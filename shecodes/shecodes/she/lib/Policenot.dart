import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:she/Callpolice.dart';

class Policenot extends StatelessWidget {
  const Policenot({super.key});

  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        // Background content
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/user1.png'), // Provide correct image path
                                  fit: BoxFit.cover, // Adjust as needed
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Hello Seli",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20), // Spacer between the Row and the centered Container
                        Center(
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/sos.png'),
                                fit: BoxFit.cover, // Adjust as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 55), // Spacer between the centered Container and the Row of images
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5), // Adjust the horizontal padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/callpolice.png', // Provide correct image path
                                    height: 80,
                                    width: 80, // Adjust width to 80
                                    fit: BoxFit.cover, // Adjust as needed
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Call Police',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/alerttext.png', // Provide correct image path
                                    height: 80,
                                    width: 80, // Adjust width to 80
                                    fit: BoxFit.cover, // Adjust as needed
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Alert Text',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/audio.png', // Provide correct image path
                                    height: 80,
                                    width: 80, // Adjust width to 80
                                    fit: BoxFit.cover, // Adjust as needed
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Audio Recording',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40), // Spacer between the rows of images
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5), // Adjust the horizontal padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/fakecall.png', // Provide correct image path
                                    height: 80,
                                    width: 80, // Adjust width to 80
                                    fit: BoxFit.cover, // Adjust as needed
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Fake Call',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/complaint.png', // Provide correct image path
                                    height: 80,
                                    width: 80, // Adjust width to 80
                                    fit: BoxFit.cover, // Adjust as needed
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Make a Complaint',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/emergency.png', // Provide correct image path
                                    height: 80,
                                    width: 80, // Adjust width to 80
                                    fit: BoxFit.cover, // Adjust as needed
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Contact List',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/homelogo.png',
                            height: 35,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/safetytipslogo.png',
                            height: 35,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Safety Tips',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
        AlertDialog(
          title: Text('Attention!'),
          content: Text('It will generate a emergency call to your nearby Police Station '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Callpolice()), // Navigate to CallMinistry.dart
                );
              },
              child: Text(
                'Call',
                style: TextStyle(color: Colors.pink), // Pink color
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.pink), // Pink color
              ),
            ),
          ],
        ),
      ],
    );
  }
}

