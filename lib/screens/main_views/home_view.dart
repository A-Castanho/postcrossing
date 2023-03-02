import 'package:flutter/material.dart';
import 'package:postcrossing/logic/ui/mainview.dart';
import 'package:postcrossing/widgets/customappbar.dart';
import 'package:screen_config/screen_config.dart';

import '../../content/image_routes.dart';
import '../../widgets/inclined_picture.dart';
import '../send_screen.dart';

final homeView = MainViewData(
    view: const HomeViewBody(),
    appbar: CustomAppBar(
      title: Image.asset(routeLongLogo),
    ),
    icon: Icon(Icons.home));

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  final username = "Amanda";

  final greeting = "Salam";
  final noSent = 2;
  final noReceived = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text("$greeting,$username!"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 13.0),
                child: Container(
                  width: ScreenConfig.blockSizeHorizontal * 30,
                  child: InclinedImage(
                    angle: -0.22,
                    width: ScreenConfig.blockSizeHorizontal * 30,
                    imageUrl:
                        "https://i.pinimg.com/originals/8e/93/53/8e9353f2b3780d42fcf4094679cd6aba.jpg",
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
          SizedBox(
            height: ScreenConfig.blockSizeVertical * 30,
            child: _buildSendButtons(context),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Did you know...?'),
                  Divider(),
                  Text(
                      'Postcrossing started 17 years, 7 months, 16 days and 18 hours ago!'),
                  Divider(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildSendButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildGridItem(context),
          _buildGridItem(context),
          /*   TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.attach_email_rounded),
                      label: Text('Register')), */
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(SendScreen.name);
        },
        icon: FittedBox(
          child: Column(
            children: [Icon(Icons.attach_email_rounded), Text('Send')],
          ),
        ),
      ),
    ));
  }
}
