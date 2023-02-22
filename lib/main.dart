import 'package:flutter/material.dart';
import 'package:postcrossing/screens/mainScreen.dart';
import 'package:screen_config/screen_config.dart';
import 'screens/send_screen.dart';
import 'screens/sent_wall.dart';

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
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black),
          headline4: TextStyle(color: Colors.black),
          headline5: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Colors.black),
        ),
      ),
      home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenConfig.init(context);
    return MainScreen();
  }
}
