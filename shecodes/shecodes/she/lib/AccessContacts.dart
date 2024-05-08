import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:she/homepage.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessContacts extends StatelessWidget {
  const AccessContacts({Key? key});

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
                                  image: AssetImage(
                                      'assets/user1.png'), // Provide correct image path
                                  fit: BoxFit.cover, // Adjust as needed
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Hello Seli",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height:
                                20), // Spacer between the Row and the centered Container
                        Center(
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/sos.png'),
                                fit: BoxFit.cover, // Adjust as needed
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                55), // Spacer between the centered Container and the Row of images
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5), // Adjust the horizontal padding
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
                                  const SizedBox(height: 5),
                                  const Text(
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
                                  const SizedBox(height: 5),
                                  const Text(
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
                                  const SizedBox(height: 5),
                                  const Text(
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
                        const SizedBox(
                            height: 40), // Spacer between the rows of images
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5), // Adjust the horizontal padding
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
                                  const SizedBox(height: 5),
                                  const Text(
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
                                  const SizedBox(height: 5),
                                  const Text(
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
                                  const SizedBox(height: 5),
                                  const Text(
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the horizontal padding
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
                          const SizedBox(height: 5),
                          const Text(
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
                          const SizedBox(height: 5),
                          const Text(
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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/contacts.png', // Provide correct image path
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 10),
              const Text('Allow SheSafe to access your Contacts '),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                give_permission_contact(context);
              },
              child: const Text(
                'Access',
                style: const TextStyle(color: Colors.pink), // Pink color
              ),
            ),
            TextButton(
              onPressed: () {
                not_give_permission_contact(context);
              },
              child: const Text(
                'Deny',
                style: TextStyle(color: Colors.pink), // Pink color
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> give_permission_contact(BuildContext context) async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      Fluttertoast.showToast(
        msg: "Contact permission recieved.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => homepage()),
          (Route<dynamic> route) => false,
        );
      });
    } else {
      // Permission denied, handle denied state
      not_give_permission_contact(context);
      Fluttertoast.showToast(
        msg: "Contact permission not granted.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void not_give_permission_contact(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      // Navigate to the login page and remove all other routes from the navigation stack
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => homepage()),
        (Route<dynamic> route) => false,
      );
    });
  }
}
