import 'package:flutter/material.dart';
import 'package:she/Login.dart';
import 'package:she/Welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcomescreen(),
    );
  }
}
