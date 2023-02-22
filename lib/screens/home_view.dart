import 'package:flutter/material.dart';
import 'package:screen_config/screen_config.dart';

import '../widgets/inclined_picture.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  final username = "Amanda";

  final greeting = "Salam";
  final noSent = 2;
  final noReceived = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$greeting,$username!"),
        //TODO Slightly rotate img like a stamp
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InclinedImage(
              angle: -0.22,
              width: ScreenConfig.blockSizeHorizontal * 30,
              imageUrl:
                  "https://www.trustenablement.com/wp-content/uploads/2022/05/freepik.jpg",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("$noReceived received"),
                Text("$noSent sent"),
              ],
            ),
            SizedBox.shrink()
          ],
        )
      ],
    );
  }
}
