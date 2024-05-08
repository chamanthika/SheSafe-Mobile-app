
//done by MGJC RANAWEER - INDEX-24466------------------------

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:she/Texttemplate.dart';
import 'package:she/globals.dart';
import 'package:she/homepage.dart';
import 'package:http/http.dart' as http;

List<Map<String, dynamic>> emergencyContacts = [];

class AlertText extends StatefulWidget {
  const AlertText({Key? key});

  @override
  State<AlertText> createState() => _AlerttextState();
}

class _AlerttextState extends State<AlertText> {
  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Text',
      theme: ThemeData(
        primaryColor:
            Colors.pink[50], // Setting app bar background color to pink[50]
      ),
      home: const AlertTextScreen(),
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
          emergencyContacts =
              data.values.toList().cast<Map<String, dynamic>>().map((contact) {
            return {...contact, 'selected': false};
          }).toList();
        });
        print(emergencyContacts);
      } else {
        throw Exception('Failed to fetch contacts');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error
    }
  }
}

class AlertTextScreen extends StatefulWidget {
  const AlertTextScreen({Key? key});

  @override
  _AlertTextScreenState createState() => _AlertTextScreenState();
}

class _AlertTextScreenState extends State<AlertTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.pink[50], // Setting app bar background color to pink[50]
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homepage()),
                ); // Navigate to the previous page (home page)
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(width: 8), // Adding space between icon and text
            const Text(
              'Alert Text',
              style: TextStyle(
                  color: Colors.pink), // Setting app bar text color to pink
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Select contact from the list to send',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: emergencyContacts.length +
                    1, // Add 1 for the "Add New Contact" button
                itemBuilder: (context, index) {
                  if (index < emergencyContacts.length) {
                    // For contact items
                    return Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/Mom.png'),
                          ),
                          title: Text(
                              '${emergencyContacts[index]['f_name']} ${emergencyContacts[index]['l_name']}'),
                          trailing: Checkbox(
                            value:
                                emergencyContacts[index]['selected'] ?? false,
                            onChanged: (bool? value) {
                              setState(() {
                                emergencyContacts[index]['selected'] = value;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.transparent),
                            checkColor: Colors.pink,
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.pink.withOpacity(0.04)),
                            side: const BorderSide(color: Colors.pink),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          height: 10,
                          color: Colors.black,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  } else {}
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            select_tel();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink[50],
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Send'),
            ],
          ),
        ),
      ),
    );
  }

  void select_tel() {
    List<Map<String, dynamic>> selectedContacts = [];

    for (var contact in emergencyContacts) {
      if (contact['selected'] == true) {
        selectedContacts.add(contact);
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Texttemplate(selectedContacts: selectedContacts)),
    );
  }
}
