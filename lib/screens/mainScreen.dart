import 'package:flutter/material.dart';
import 'package:postcrossing/screens/sent_wall.dart';
import 'package:screen_config/screen_config.dart';

import 'home_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen":  SentWallView(), "title": "", "icon": Icon(Icons.email)},
    {"screen": const HomeView(), "title": "", "icon": Icon(Icons.home)},
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedScreenIndex]["screen"],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedScreenIndex,
            onTap: _selectScreen,
            items: _screens
                .map((e) =>
                    BottomNavigationBarItem(icon: e['icon'], label: e['title']))
                .toList()));
  }
}
