import 'package:flutter/material.dart';
import 'package:screen_config/screen_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  final username = "Amanda";

  final greeting = "Salam";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$greeting,$username!"),
        //TODO Slightly rotate img like a stamp
        Container(
          color: Colors.blue,
          child: Text('phoyo'),
          height: ScreenConfig.blockSizeHorizontal * 50,
        )
      ],
    );
  }
}
