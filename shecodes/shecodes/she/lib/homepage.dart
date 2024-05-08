import 'package:flutter/material.dart';
import 'package:she/Alerttext.dart';
import 'package:she/Policenot.dart';
import 'package:she/Complaint.dart';
import 'package:she/Contacts.dart';
import 'package:she/Fakecall.dart';
import 'package:she/Profile.dart';
import 'package:she/Recording.dart';
import 'package:she/Safetytips.dart';
import 'package:she/Sosnotf.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        child: Row(
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
                      ),
                      const SizedBox(
                          height:
                              20), // Spacer between the Row and the centered Container
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Sosnotf()),
                            );
                          },
                          child: Container(
                            height: 180,
                            width: 180,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/sos.png'),
                                fit: BoxFit.cover, // Adjust as needed
                              ),
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Policenot()),
                                );
                              },
                              child: Column(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AlertText()),
                                ); // Navigate to alert text screen
                              },
                              child: Column(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Recording()),
                                );
                              },
                              child: Column(
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
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40), // Spacer between the rows of images
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5), // Adjust the horizontal padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Fakecall()),
                                ); // Navigate to fake call screen
                              },
                              child: Column(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Complaint()),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/complaint.png', // Provide correct image path
                                    height: 80,
                                    width: 80, // Adjust width to 80
                                    fit: BoxFit.cover, // Adjust as needed
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    ' Make a Complaint',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Contacts()),
                                ); // Navigate to emergency screen
                              },
                              child: Column(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Safetytips()),
                        );
                      },
                      child: Column(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
