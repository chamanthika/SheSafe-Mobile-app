import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AddNewCont.dart'; // Import your AddNewCont.dart page
import 'package:she/globals.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50], // Light pink color
        title: const Text(
          'Emergency contacts',
          style: TextStyle(color: Colors.pink),
        ), // Title text
      ),
      body: ListView.builder(
        itemCount:
            contacts.length + 1, // Add 1 for the "Add New Contact" button
        itemBuilder: (context, index) {
          if (index < contacts.length) {
            // For contact items
            return Column(
              children: [
                const SizedBox(height: 20), // Add space above each contact
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/Mom.png',
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${contacts[index]['f_name']} ${contacts[index]['l_name']}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  contacts[index][
                                      'mobile'], // Display the contact number as subtitle
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Pushes the text to the right side of the screen
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0), // Adjusted padding
                        child: GestureDetector(
                          onTap: () {
                            removeContact(context, contacts[index]['id']);
                          },
                          child: const Text(
                            'Remove',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ],
            );
          } else {
            // For the "Add New Contact" button
            return Column(
              children: [
                const SizedBox(height: 50), // Add space above the button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddnewCont(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Adjust container width
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.pink[50], // Light pink color
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      child: const Text(
                        '+ Add New Contact ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add space below the button
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> fetchContacts() async {
    final url =
        Uri.parse('$globalUrl/em_Contacts/singleUserContacts/$logged_user');

    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        String jsonString = response.body;
        Map<String, dynamic> data = json.decode(jsonString);
        setState(() {
          contacts = data.values.toList().cast<Map<String, dynamic>>();
        });
        print(contacts);
      } else {
        throw Exception('Failed to fetch contacts');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error
    }
  }

  Future<void> removeContact(contact, id) async {
    try {
      final url = Uri.parse(
          '$globalUrl/em_Contacts/deleteEmergencyContact/$logged_user/$id');

      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        // Successful creation of resource
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Telephone Number is deleted.'),
          ),
        );
        fetchContacts();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to delete contact. Please try again later.'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An unexpected error occurred.'),
        ),
      );
    }
  }
}
