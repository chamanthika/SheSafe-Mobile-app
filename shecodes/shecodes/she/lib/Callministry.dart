import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:she/globals.dart';
import 'homepage.dart'; // Import homepage.dart

class Callministry extends StatelessWidget {
  const Callministry({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[50], // Set screen color to light pink
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const Text(
                'Calling...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                  height:
                      10), // Add space between the text and the additional text
              const Text(
                '+94112186055',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height:
                      220), // Add space between the additional text and the row of images
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Adjusts space evenly between the images
                children: [
                  Image.asset(
                    'assets/speaker.png',
                    height: 80,
                    width: 80,
                  ),
                  Image.asset(
                    'assets/keypad.png',
                    height: 80,
                    width: 80,
                  ),
                  Image.asset(
                    'assets/microphone.png',
                    height: 80,
                    width: 80,
                  ),
                ],
              ),
              const SizedBox(
                  height:
                      110), // Add space between the row of images and the end call image
              GestureDetector(
                onTap: () {
                  makePhoneCall('+94711044609', context);
                },
                child: Image.asset(
                  'assets/endcall.png',
                  height: 80,
                  width: 80,
                ),
              ),
              // Add more widgets here as needed
            ],
          ),
        ),
      ),
    );
  }

  void makePhoneCall(String phoneNumber, BuildContext context) async {
    try {
      Map<String, dynamic> requestBody = {
        'user_id': logged_user,
      };

      final url = Uri.parse('$globalUrl/complain/saveComplain');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Complain saved successfully.'),
          ),
        );
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const homepage()),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
