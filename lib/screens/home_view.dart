import 'package:flutter/material.dart';
import 'package:postcrossing/widgets/customappbar.dart';
import 'package:screen_config/screen_config.dart';

import '../content/image_routes.dart';
import '../widgets/inclined_picture.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  final username = "Amanda";

  final greeting = "Salam";
  final noSent = 2;
  final noReceived = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Image.asset(routeLongLogo),
      ),
      body: Container(
        color: Colors.amber.shade50,
        child: Expanded(
          child: Column(
            children: [
              Text("$greeting,$username!"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: ScreenConfig.blockSizeHorizontal * 30,
                      child: InclinedImage(
                        angle: -0.22,
                        width: ScreenConfig.blockSizeHorizontal * 30,
                        imageUrl:
                            "https://www.trustenablement.com/wp-content/uploads/2022/05/freepik.jpg",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("$noReceived received"),
                        Divider(),
                        Text("$noSent sent"),
                      ],
                    ),
                  ),
                  SizedBox.shrink()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    _buildGridItem(),
                    _buildGridItem(),
                    /*   TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.attach_email_rounded),
                        label: Text('Register')), */
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildGridItem() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: IconButton(
        onPressed: () {},
        icon: FittedBox(
          child: Column(
            children: [Icon(Icons.attach_email_rounded), Text('Send')],
          ),
        ),
      ),
    ));
  }
}
