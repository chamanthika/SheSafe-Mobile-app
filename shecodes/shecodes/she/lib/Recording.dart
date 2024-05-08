import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Recording extends StatefulWidget {
  const Recording({Key? key}) : super(key: key);

  @override
  _RecordingState createState() => _RecordingState();
}

class _RecordingState extends State<Recording> {
  bool isRecording = false;
  void startRecording() {
    // Implement recording logic here
    setState(() {
      isRecording = true;
    });
  }

  void stopRecording() {
    // Implement stop recording logic here
    setState(() {
      isRecording = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: const Text(
          'Audio Recording',
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 200),
          SizedBox(
            width: 200, // Set the width of the circular button
            height: 200, // Set the height of the circular button
            child: ClipOval(
              child: ElevatedButton(
                onPressed: isRecording ? stopRecording : startRecording,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.pink), // Set the background color to pink
                ),
                child: Text(
                  isRecording ? 'Stop Recording' : 'Start Recording',
                  style: const TextStyle(
                    color: Colors.white, // Set the text color to white
                    fontSize: 20, // Set the font size to 16
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        const SizedBox(height: 5),
                        const Text(
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
                        const SizedBox(height: 5),
                        const Text(
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
          ),
        ],
      ),
    );
  }
}
