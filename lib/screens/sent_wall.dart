import 'dart:math';

import 'package:flutter/material.dart';
import 'package:screen_config/screen_config.dart';

import '../logic/models/postcard.dart';

Widget _buildFlexSpace() {
  const int repeatCount = 10;
  final double stepSize = 1 / (repeatCount * 3 - 1);
  final List<double> stops =
      List.generate(repeatCount * 3, (i) => i * stepSize);

  final List<Color> colors = List.generate(repeatCount * 3, (i) {
    if (i % 6 == 0 || i % 6 == 1) {
      return Color(0xffd72147);
    } else if (i % 6 == 2 || i % 6 == 3) {
      return Colors.white;
    } else {
      return Color(0xff3475b9);
    }
  });
  return Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 0.2, 0.5, 0.8, 1.0],
      colors: [
        Colors.red,
        Colors.white,
        Colors.blue,
        Colors.white,
        Colors.white,
      ],
    ),
  ),
)
;

  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        tileMode: TileMode.repeated,
        colors: colors,
        stops: stops,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        transform: GradientRotation(-45 * pi / 180),
      ),
    ),
  );
}

class SentWallView extends StatefulWidget {
  static final appbar = AppBar(
      title: Text('My App'),
      backgroundColor: Colors.white, // Set the background color to white
      elevation: 0, // Remove the shadow
      flexibleSpace:
          _buildFlexSpace() /* Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffd72147),
              Color(0xffd72147),
              Colors.transparent,
              Colors.transparent,
              Color(0xff3475b9),
              Color(0xff3475b9),
              Colors.transparent,
              Colors.transparent,
              Color(0xffd72147),
              Color(0xffd72147),
              Colors.transparent,
              Colors.transparent,
              Color(0xff3475b9),
              Color(0xff3475b9),
              Colors.transparent,
              Colors.transparent,
            ],
            stops: [
              0.0,
              0.2,
              0.2,
              0.3,
              0.3,
              0.5,
              0.5,
              1.0,
              1.0,
              1.2,
              1.2,
              1.3,
              1.3,
              1.5,
              1.5,
              2.0,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(-45 * pi / 180),
          ),
        ),
      ) */
      );

  const SentWallView({super.key});

  @override
  State<SentWallView> createState() => _SentWallViewState();
}

class _SentWallViewState extends State<SentWallView> {
  @override
  Widget build(BuildContext context) {
    final List postcards = List.generate(14, (i) {
      return Postcard(
          id: 'DE-12345678',
          imgPath:
              'https://www.action-mailing.com/wp-content/uploads/2020/05/designing-a-postcard.jpg',
          orientation: Random().nextBool()
              ? PostCardOrientation.horizontal
              : PostCardOrientation.vertical);
    });
    var i = -1;

    return GestureDetector(
      onTap: () => setState(() {}),
      child: SizedBox(
        width: ScreenConfig.screenWidth,
        height: ScreenConfig.screenHeight,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: postcards.map((element) {
              i++;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: FittedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        width: postcards[i].orientation ==
                                PostCardOrientation.vertical
                            ? ScreenConfig.blockSizeHorizontal * 23
                            : ScreenConfig.blockSizeHorizontal * 40,
                        height: postcards[i].orientation ==
                                PostCardOrientation.vertical
                            ? ScreenConfig.blockSizeHorizontal * 40
                            : ScreenConfig.blockSizeHorizontal * 23,
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    spreadRadius: 0.1,
                                    blurRadius: 7)
                              ],
                              border: Border.all(color: Colors.white),
                              image: DecorationImage(
                                  image: NetworkImage(postcards[i].imgPath),
                                  fit: BoxFit.fill)),
                          child: Text(i.toString()),
                          /*   color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0), */
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(postcards[i].id)
                    ],
                  ),
                ),
              );
            }).toList(),
            /* children: [
            
              Flexible(
                child: SizedBox(
                  width: ScreenConfig.blockSizeHorizontal * 55,
                  height: ScreenConfig.blockSizeVertical * 23,
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: ScreenConfig.blockSizeHorizontal * 40,
                  height: ScreenConfig.blockSizeVertical * 45,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: ScreenConfig.blockSizeHorizontal * 40,
                  height: ScreenConfig.blockSizeVertical * 25,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: ScreenConfig.blockSizeHorizontal * 40,
                  height: ScreenConfig.blockSizeVertical * 30,
                  child: Container(
                    color: Colors.orange,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: ScreenConfig.blockSizeHorizontal * 40,
                  height: ScreenConfig.blockSizeVertical * 25,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: ScreenConfig.blockSizeHorizontal * 60,
                  height: ScreenConfig.blockSizeVertical * 45,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          */
          ),
        ),
      ),
    );
  }
}
