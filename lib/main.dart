import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postcrossing/screens/mainScreen.dart';
import 'package:postcrossing/screens/postcard_exchange/send/send_screen.dart';
import 'package:screen_config/screen_config.dart';
import 'screens/postcard_exchange/send/send_terms_screen.dart';
import 'screens/main_views/wall_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          displayLarge: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
          headlineMedium: TextStyle(color: Colors.black),
          headlineSmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
        ),
      ),
      routes: {
        '/': (context) => const AppHome(),
        SendTermsScreen.name: (context) => const SendTermsScreen(),
        SendScreen.name: (context) => const SendScreen(),
      },
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
    return const MainScreen();
  }
}
