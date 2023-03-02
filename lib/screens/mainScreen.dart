import 'package:flutter/material.dart';
import 'package:postcrossing/logic/ui/mainview.dart';
import 'package:postcrossing/screens/main_views/wall_view.dart';
import 'package:screen_config/screen_config.dart';

import 'main_views/blog_view.dart';
import 'main_views/home_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;
  final List<MainViewData> _views = [
    homeView,
    blogView,
    wallView,
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _views[_selectedScreenIndex].appbar,
        body: _views[_selectedScreenIndex].view,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedScreenIndex,
            onTap: _selectScreen,
            items: _views
                .map((e) =>
                    BottomNavigationBarItem(icon: e.icon, label: e.title))
                .toList()));
  }
}
