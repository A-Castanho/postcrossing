import 'dart:math';

import 'package:flutter/material.dart';
import 'package:postcrossing/widgets/customappbar.dart';
import 'package:postcrossing/widgets/main_view.dart';
import 'package:screen_config/screen_config.dart';
import 'dart:developer' as dev;

import '../logic/models/postcard.dart';
import '../widgets/hero_dialog.dart';

class SentWallView extends StatefulWidget with MainView {
  SentWallView({super.key});

  @override
  State<SentWallView> createState() => _SentWallViewState();
}

class _SentWallViewState extends State<SentWallView> {
  final verticalPostcardWidth = ScreenConfig.blockSizeHorizontal * 23;
  final verticalPostcardHeight = ScreenConfig.blockSizeHorizontal * 40;
  final horizontalPostcardHeight = ScreenConfig.blockSizeHorizontal * 23;
  final horizontalPostcardWidth = ScreenConfig.blockSizeHorizontal * 40;

  @override
  Widget build(BuildContext context) {
    final List postcards = List.generate(14, (i) {
      return Postcard(
          id: 'DE-' + Random().nextInt(9999).toString(),
          imgPath:
              'https://marketplace.canva.com/EAFIysMXPqY/1/0/1600w/canva-white-simple-minimalist-post-card-c7OQIK8AUQ4.jpg',
          orientation: Random().nextBool()
              ? PostCardOrientation.horizontal
              : PostCardOrientation.vertical);
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: Container(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () => setState(() {}), child: Text('Favorites')),
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () => setState(() {}), child: Text('Sent'))),
              Expanded(
                child: TextButton(
                    onPressed: () => setState(() {}), child: Text('Received')),
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => setState(() {}),
        child: SizedBox(
          width: ScreenConfig.screenWidth,
          height: ScreenConfig.screenHeight,
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: postcards.map((element) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FittedBox(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new HeroDialogRoute(
                                builder: (BuildContext context) {
                                  return new Center(
                                    child: _buildPostcard(element, size: 2.5),
                                  );
                                },
                              ),
                            );
                          },
                          child: _buildPostcard(element),
                        ),
                        SizedBox(height: 5),
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
      ),
    );
  }

  Hero _buildPostcard(Postcard element, {double size = 1.0}) {
    return Hero(
      tag: 'postcard${element.id}',
      child: SizedBox(
        width: element.orientation == PostCardOrientation.vertical
            ? verticalPostcardWidth * size
            : horizontalPostcardWidth * size,
        height: element.orientation == PostCardOrientation.vertical
            ? verticalPostcardHeight * size
            : horizontalPostcardHeight * size,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 0.1,
                    blurRadius: 7)
              ],
              border: Border.all(color: Colors.white),
              image: DecorationImage(
                  image: NetworkImage(element.imgPath), fit: BoxFit.fill)),
          /*   color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1.0), */
        ),
      ),
    );
  }
}
