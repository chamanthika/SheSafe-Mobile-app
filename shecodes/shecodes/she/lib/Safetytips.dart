
//done by - MGJC RANAWEERA -index - 24466

import 'package:flutter/material.dart';
import 'package:she/SelfDefense.dart';

class Safetytips extends StatelessWidget {
  const Safetytips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50], // Light pink color
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5), // Add padding to the left of the text
            Text(
              'Safety Tips',
              style: TextStyle(color: Colors.pink), // Text color set to pink
            ), // Title text
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Add space between app bar and images
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset('assets/tips.png', height: 78, width: 148), // Image 1
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        'Safety Tips',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Text color set to black
                          fontWeight: FontWeight.bold, // Text is bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the SelfDefense screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelfDefense()),
                  );
                },
                child: Stack(
                  children: [
                    Image.asset('assets/defence.png', height: 78, width: 148), // Image 2
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Text(
                          'Self Defense',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black, // Text color set to black
                            fontWeight: FontWeight.bold, // Text is bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space between images and containers
          Container(
            color: Colors.pink[50], // Light pink color
            height: 130,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset('assets/travelling.png', height: 100, width: 100), // Left image for container 1
                SizedBox(width: 10), // Add spacing between image and container
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10), // Add spacing between image and text
                      Text(
                        'Travelling',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Text color set to black
                          fontWeight: FontWeight.bold, // Text is bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Add space between containers
          Container(
            color: Colors.pink[50], // Light pink color
            height: 130,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset('assets/shopping.png', height: 100, width: 100), // Left image for container 2
                SizedBox(width: 10), // Add spacing between image and container
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10), // Add spacing between image and text
                      Text(
                        'Shopping',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Text color set to black
                          fontWeight: FontWeight.bold, // Text is bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Add space between containers
          Container(
            color: Colors.pink[50], // Light pink color
            height: 130,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset('assets/online.png', height: 100, width: 100), // Left image for container 3
                SizedBox(width: 10), // Add spacing between image and container
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10), // Add spacing between image and text
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Text color set to black
                          fontWeight: FontWeight.bold, // Text is bold
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
      bottomNavigationBar: Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding
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
                  SizedBox(height: 5),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/safetytipslogo.png',
                    height: 35,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Safety Tips',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
