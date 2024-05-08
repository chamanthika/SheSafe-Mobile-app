import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:she/AccessMicroph.dart';
import 'package:she/globals.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:she/homepage.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login({Key? key});

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      String email = emailController.text;
      String password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: const Text('Please fill in all fields.'),
          ),
        );
        return;
      }

      LoginAction(context, email, password);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/she2.png',
              width: 200,
              height: 200,
            ),
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, color: Colors.pink),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.pink),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.pink),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (v) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.0, color: Colors.pink)),
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ],
                      ),
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    child: const Text('SIGN-IN'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'or connect using',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, color: Colors.pink),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/googlelogo.png",
                        height: 40,
                      ),
                      Image.asset(
                        "assets/fblogo.png",
                        height: 40,
                      ),
                      Image.asset(
                        "assets/instalogo.png",
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> LoginAction(
      BuildContext context, String email, String password) async {
    try {
      final url = Uri.parse('$globalUrl/users/login');
      final Map<String, dynamic> data = {"email": email, "password": password};

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logged_user = email;

        // Successful creation of resource
        print('User data saved successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successfully.'),
          ),
        );

        var micStatus = await Permission.microphone.status;
        var locationStatus = await Permission.location.status;
        var contactsStatus = await Permission.contacts.status;

        if (micStatus.isGranted &&
            locationStatus.isGranted &&
            contactsStatus.isGranted) {
          // If all permissions are granted, navigate to the home page
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const AccessMicroph()),
              (Route<dynamic> route) => false,
            );
          });
        } else {
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const homepage()),
              (Route<dynamic> route) => false,
            );
          });
        }
      } else {
        // Handle other status codes as errors
        print('API call failed with status code ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please try again later.'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Network error. Please check your internet connection.'),
        ),
      );
    }
  }
}
