import 'package:flutter/material.dart';
import 'package:screen_config/screen_config.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final username = "Amanda";

  final greeting = "Salam";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '')
        ]),
        body: Column(
          children: [
            Text("$greeting,$username!"),
            //TODO Slightly rotate img like a stamp
            Container(
              color: Colors.blue,
              child: Text('phoyo'),
              height: ScreenConfig.blockSizeHorizontal * 50,
            )
          ],
        ));
  }
}
