import 'package:flutter/material.dart';

class RecorList extends StatelessWidget {
  const RecorList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50], // Light pink color
        title: Text(
          'Audio Recordings',
          style: TextStyle(color: Colors.pink),
        ), // Title text
      ),
      body: ListView.builder(
        itemCount: 4, // Number of recordings
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 20), // Add space between recordings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New recording ${index + 1}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2.34 pm', // Example time
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '4.56', // Example duration
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Add additional space between the texts and the list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
              ),
            ],
          );
        },
      ),
      
      );
    
  }
}
