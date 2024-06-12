
//Done by -KTN DHARMADASA -index-24920

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:she/Alerttext.dart';
import 'package:she/Msuccess.dart';
import 'package:she/globals.dart';
import 'package:http/http.dart' as http;
import 'package:she/homepage.dart';

class Texttemplate extends StatelessWidget {
  final List<Map<String, dynamic>> selectedContacts;

  const Texttemplate({super.key, required this.selectedContacts});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmergencyTextScreen(selectedContacts: selectedContacts),
    );
  }
}

class EmergencyTextScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedContacts;

  // ignore: use_super_parameters
  const EmergencyTextScreen({Key? key, required this.selectedContacts})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmergencyTextScreenState createState() => _EmergencyTextScreenState();
}

class _EmergencyTextScreenState extends State<EmergencyTextScreen> {
  List<Map<String, dynamic>> emergencyMessages = [];
  @override
  void initState() {
    super.initState();
    fun_load_text();
  }

  // ignore: non_constant_identifier_names
  Future<void> fun_load_text() async {
    final url = Uri.parse('$globalUrl/emergency_text/getAllText');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String jsonString = response.body;
        Map<String, dynamic> data = json.decode(jsonString);
        setState(() {
          emergencyMessages =
              data.values.toList().cast<Map<String, dynamic>>().map((contact) {
            return {...contact, 'selected': false};
          }).toList();
        });
        print(emergencyMessages);
      } else {
        throw Exception('Failed to fetch contacts');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlertText()),
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
        backgroundColor: Colors.pink[50],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: emergencyMessages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 8),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              emergencyMessages[index]['text'],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Checkbox(
                            value:
                                emergencyMessages[index]['selected'] ?? false,
                            onChanged: (bool? value) {
                              setState(() {
                                emergencyMessages[index]['selected'] = value;
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
                        ],
                      ),
                      onTap: () {
                        print("Sending: ${emergencyMessages[index]}");
                      },
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.black,
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            send_msg(context);
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

  // ignore: non_constant_identifier_names
  Future<void> send_msg(BuildContext context) async {
    List<Map<String, dynamic>> selectedMsg = [];

    for (var message in emergencyMessages) {
      if (message['selected'] == true) {
        selectedMsg.add(message);
      }
    }
     
       // ignore: duplicate_ignore
       // ignore: avoid_print
       print(widget.selectedContacts);
    

    try {
      final url = Uri.parse('$globalUrl/emergency_text/sendTextMsg');
      final Map<String, dynamic> data = {
        "msg_list": selectedMsg,
        "contact_list": widget.selectedContacts,
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
        fun_load_text();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Emergency Text saved successfully.'),
          ),
        );
        Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const homepage()),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        print('API call failed with status code ${response.statusCode}');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send message. Please try again later.'),
          ),
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Network error. Please check your internet connection.'),
        ),
      );
    }
  }
}
