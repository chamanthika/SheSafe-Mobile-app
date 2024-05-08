import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:she/globals.dart';

class AddnewCont extends StatefulWidget {
  const AddnewCont({Key? key}) : super(key: key);

  @override
  _AddnewContState createState() => _AddnewContState();
}

class _AddnewContState extends State<AddnewCont> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50], // Light pink color
        title: const Text(
          'Create New Contact',
          style: TextStyle(color: Colors.pink),
        ), // Title text
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First row for name
            Row(
              children: [
                // Image on the left side for name
                Image.asset(
                  'assets/contacticon.png', // Replace with your image path
                  height: 50, // Adjust height as needed
                  width: 50, // Adjust width as needed
                ),
                const SizedBox(
                    width: 16), // Add spacing between image and text field
                // Text field on the right side for name
                Expanded(
                  child: TextField(
                    controller: fnameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter first name',
                      hintStyle:
                          TextStyle(color: Colors.grey), // Hint text color
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add space between rows
            // First row for name
            Row(
              children: [
                // Image on the left side for name
                Image.asset(
                  'assets/contacticon.png', // Replace with your image path
                  height: 50, // Adjust height as needed
                  width: 50, // Adjust width as needed
                ),
                const SizedBox(
                    width: 16), // Add spacing between image and text field
                // Text field on the right side for name
                Expanded(
                  child: TextField(
                    controller: lnameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter last name',
                      hintStyle:
                          TextStyle(color: Colors.grey), // Hint text color
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Second row for phone number
            Row(
              children: [
                // Image on the left side for phone number
                Image.asset(
                  'assets/phonenum.png', // Replace with your image path
                  height: 50, // Adjust height as needed
                  width: 50, // Adjust width as needed
                ),
                const SizedBox(
                    width: 16), // Add spacing between image and text field
                // Text field on the right side for phone number
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'Enter phone number',
                      hintStyle:
                          TextStyle(color: Colors.grey), // Hint text color
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100), // Add space between rows and container
            // GestureDetector to handle tap on "Add" text
            GestureDetector(
              onTap: () {
                saveFunction(context);
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust container width
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink[50], // Light pink color
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: const Text(
                    'Add',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveFunction(BuildContext context) async {
    try {
      String fname = fnameController.text;
      String lname = lnameController.text;
      String phoneNumber = phoneController.text;

      final url = Uri.parse('$globalUrl/em_Contacts/saveContacts');
      final Map<String, String> data = {
        "f_name": fname,
        "l_name": lname,
        "mobile": phoneNumber,
        "user_id": logged_user
      };

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        // Successful creation of resource
        print('Telephone Number added successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Telephone Number added successfully.'),
          ),
        );
        clear_txt();
      } else {
        // Handle other status codes as errors
        print('API call failed with status code ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to save contact. Please try again later.'),
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

  void clear_txt() {
    fnameController.clear();
    lnameController.clear();
    phoneController.clear();
  }
}
