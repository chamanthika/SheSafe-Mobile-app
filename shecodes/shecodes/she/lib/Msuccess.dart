
//done by MGJC Ranaweera  index -24466 ----------------------


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:she/homepage.dart';

class Msuccess extends StatelessWidget {
  const Msuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmergencyTextScreen(),
    );
  }
}

class EmergencyTextScreen extends StatefulWidget {
  const EmergencyTextScreen({super.key});

  @override
  _EmergencyTextScreenState createState() => _EmergencyTextScreenState();
}

class _EmergencyTextScreenState extends State<EmergencyTextScreen> {
  bool _showAlert = false;

  final List<String> emergencyMessages = [
    "I am in danger. Need help!",
    "Someone is following me. \n I need help.",
    "I am in a threatening situation \n and need immediate intervention.",
    "I feel unsafe and need \n immediate assistance."
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      // Add your navigation logic here
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Alert Text',
                    style: TextStyle(color: Colors.pink),
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 221, 186, 198),
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
                                    emergencyMessages[index],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Checkbox(
                                  value: false,
                                  onChanged: (bool? value) {},
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  fillColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                                  checkColor: Colors.pink,
                                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.pink.withOpacity(0.04)),
                                  side: const BorderSide(color: Colors.pink),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Code to send the selected message
                              Text("Sending: ${emergencyMessages[index]}");
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
                  setState(() {
                    _showAlert = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 217, 186, 195),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
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
          ),
          if (_showAlert)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showAlert = false;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Center(
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.pink,
                            size: 48.0,
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Message Sent Successfully',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const homepage()),
              );
                              setState(() {
                                _showAlert = false;
                              });
                              // Add your navigation logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
