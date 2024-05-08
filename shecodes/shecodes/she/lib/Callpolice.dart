import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:she/globals.dart';
import 'homepage.dart';

class Callpolice extends StatefulWidget {
  const Callpolice({Key? key});

  @override
  State<Callpolice> createState() => _CallpoliceState();
}

class _CallpoliceState extends State<Callpolice> {
  late Position _currentPosition;
  String _policeName = '';
  String _policeNumber = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      if (Platform.isAndroid) {
        LocationPermission permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Handle case when permission is denied
          print('Location permission denied.');
          return;
        }
      } else {
        print('Location permission not denied.');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
        getNearestPoliceStation(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Image.asset(
                'assets/policelogo.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 20),
              const Text(
                'Calling....',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _policeName.isNotEmpty ? _policeName : 'Police.',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/speaker.png',
                    height: 80,
                    width: 80,
                  ),
                  Image.asset(
                    'assets/keypad.png',
                    height: 80,
                    width: 80,
                  ),
                  Image.asset(
                    'assets/microphone.png',
                    height: 80,
                    width: 80,
                  ),
                ],
              ),
              const SizedBox(height: 90),
              InkWell(
                onTap: () {
                  call_cut_action(context);
                },
                child: Image.asset(
                  'assets/endcall.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getNearestPoliceStation(
      double latitude, double longitude) async {
    try {
      Map<String, double> requestBody = {
        'latitude': latitude,
        'longitude': longitude,
      };

      final url = Uri.parse('$globalUrl/em_Contacts/loadPoliceStation');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        var resBody = jsonDecode(response.body);
        setState(() {
          _policeName = resBody['name'] ?? 'Police.';
          _policeNumber = resBody['contact'];
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> call_cut_action(BuildContext context) async {
    try {
      Map<String, dynamic> requestBody = {
        'user_id': logged_user,
        'call_to': _policeNumber,
        'type': "Police Call",
      };

      final url = Uri.parse('$globalUrl/em_Contacts/callDataSave');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Success: Call is saved.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        Future.delayed(Duration(milliseconds: 500), () {
          // Navigate to the login page and remove all other routes from the navigation stack
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => homepage()),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        Fluttertoast.showToast(
          msg: "Error: ${response.statusCode}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      print('Error: $e');
    }
  }
}
