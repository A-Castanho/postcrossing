import 'package:flutter/material.dart';

import 'functionalities/postcard_sending/screens/send_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postcrossing',
      home: SendScreen(),
    );
  }
}
