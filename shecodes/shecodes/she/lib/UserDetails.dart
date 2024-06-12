// done by MGJC RANAWEERA - INDEX- 24466
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:she/AccessMicroph.dart';
import 'package:she/Login.dart';
import 'package:http/http.dart' as http;
import 'package:she/globals.dart';

class UserDetails extends StatefulWidget {
  final String email;
  final String password;

  const UserDetails({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String? _selectedProvince;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phoneNumberController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 20),
            buildInputField(
                phoneNumberController, Icons.phone, 'Enter your phone number'),
            const SizedBox(height: 10),
            buildInputField(nameController, Icons.person, 'Enter your name'),
            const SizedBox(height: 10),
            buildDropdownField(Icons.location_city, 'Select your Province'),
            const SizedBox(height: 10),
            buildInputField(
                addressController, Icons.location_on, 'Enter your address'),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Get the text field values
                  String phoneNumber = phoneNumberController.text;
                  String name = nameController.text;
                  String address = addressController.text;
                  String email = widget.email;
                  String password = widget.password;
                  String province = _selectedProvince ?? '';

                  save_function(context, phoneNumber, name, address, email,
                      password, province);
                  // print('Email: $email');
                  // print('Password: $password');
                  // print('Phone Number: $phoneNumber');
                  // print('Name: $name');
                  // print('Address: $address');
                  // Submit the data or navigate to the next screen
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AccessMicroph()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  textStyle: const TextStyle(fontSize: 15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Submit'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(
      TextEditingController controller, IconData icon, String hintText) {
    return Container(
      width: 350,
      height: 50,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField(IconData icon, String hintText) {
    return Container(
      width: 350,
      height: 50,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(
                hint: Text(
                  hintText,
                  style: const TextStyle(fontStyle: FontStyle.normal),
                ),
                dropdownColor: Colors.white,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                iconSize: 36,
                isExpanded: true,
                value: _selectedProvince,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedProvince = newValue;
                  });
                },
                underline: const SizedBox(),
                items: <String>[
                  'Select your Province',
                  'Western Province',
                  'Central Province',
                  'Southern Province',
                  'Northern Province',
                  'Eastern Province',
                  'North Western Province',
                  'North Central Province',
                  'Uva Province',
                  'Sabaragamuwa Province'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> save_function(
      BuildContext context,
      String phoneNumber,
      String name,
      String address,
      String email,
      String password,
      String province) async {
    try {
      final url = Uri.parse('$globalUrl/users/usersSave');
      final Map<String, dynamic> data = {
        "email": email,
        "password": password,
        "tel": phoneNumber,
        "name": name,
        "province": province,
        "address": address
      };

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successful creation of resource
        print('User data saved successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Resgistration successfully.'),
          ),
        );
        Future.delayed(Duration(milliseconds: 500), () {
          // Navigate to the login page and remove all other routes from the navigation stack
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        // Handle other status codes as errors
        print('API call failed with status code ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to save user data. Please try again later.'),
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
