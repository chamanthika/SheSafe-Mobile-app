
//Done by -KTN DHARMADASA -index-24920

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:she/homepage.dart';
import 'package:she/globals.dart';
import 'package:http/http.dart' as http;

List<String> provinceList = [
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
];

class Updatedetails extends StatefulWidget {
  const Updatedetails({super.key});

  @override
  State<Updatedetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<Updatedetails> {
  String? _selectedProvince;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String address = '';
  String createdAt = '';
  String email = '';
  String id = '';
  String name = '';
  String password = '';
  String province = '';
  String tel = '';

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phoneController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50], // Light pink color
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.pink),
        ), // Title text
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 10), // Add SizedBox between AppBar and Image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/user1.png',
                  width: 100,
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Edit your profile picture',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Add space between text and image
                    Image.asset(
                      'assets/edit.png', // Replace with your image path
                      width: 20, // Adjust width as needed
                      height: 20, // Adjust height as needed
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                buildInputField(
                    Icons.phone, 'Enter your phone number', phoneController),
                const SizedBox(height: 10),
                buildInputField(
                    Icons.person, 'Enter your name', nameController),
                const SizedBox(height: 10),
                buildDropdownField(Icons.location_city, 'Select your Province'),
                const SizedBox(height: 10),
                buildInputField(
                    Icons.location_on, 'Enter your address', addressController),
                const SizedBox(height: 20),
                buildButton('Update'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(
      IconData icon, String hintText, TextEditingController controller) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
      ),
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
    );
  }

  Widget buildButton(String label) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          update_profile(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          textStyle: const TextStyle(fontSize: 15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }

  Future<void> loadProfileData() async {
    try {
      final response = await http.post(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse('${globalUrl}/users/singleUser'),
        body: json.encode({'email': logged_user}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          address = jsonData['_address'] ?? '';
          createdAt = jsonData['_createdAt'] ?? '';
          email = jsonData['_email'] ?? '';
          id = jsonData['_id'] ?? '';
          name = jsonData['_name'] ?? '';
          password = jsonData['_password'] ?? '';
          province = jsonData['_province'] ?? '';
          tel = jsonData['_tel'] ?? '';

          phoneController.text = tel;
          nameController.text = name;
          addressController.text = address;
          _selectedProvince = province;
        });
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error: $error');
    }
  }

  // ignore: non_constant_identifier_names
  void update_profile(BuildContext context) async {
    try {
      final Map<String, dynamic> requestData = {
        '_address': addressController.text,
        '_name': nameController.text,
        '_tel': phoneController.text,
        '_province': _selectedProvince,
      };

      final response = await http.put(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse('${globalUrl}/users/updateUser/user@example.com'),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Profile updated successfully
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
          ),
        );
        Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const homepage()),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (error) {
      print('Error updating profile: $error');
      // Display error message
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update profile. Please try again later.'),
        ),
      );
    }
  }
}
