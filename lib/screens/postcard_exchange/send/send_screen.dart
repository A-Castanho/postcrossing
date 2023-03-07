import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:postcrossing/widgets/dot_divider.dart';
import 'package:postcrossing/widgets/inclined_picture.dart';
import 'package:screen_config/screen_config.dart';

import '../../../content/styles.dart';

class SendScreen extends StatelessWidget {
  static const name = 'send_screen';
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenConfig.screenHeight,
      width: ScreenConfig.screenWidth,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Postcard ID:'),
                          Text('PT-779567'),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              text: "Don't forget to",
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\nwrite it on your postcard',
                                    style: referenceStyle),
                                const TextSpan(text: '!'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      DotDivider.vertical(),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      text: "Olaf",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '(he/him)',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                        const TextSpan(text: '!'),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          text: "aka",
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' ho-modellfan',
                                                style: referenceStyle),
                                            const TextSpan(text: '!'),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.flag)
                                    ],
                                  ),
                                ],
                              ),
                              InclinedImage(
                                  width: 80,
                                  angle: 0,
                                  imageUrl:
                                      "https://i.pinimg.com/originals/8e/93/53/8e9353f2b3780d42fcf4094679cd6aba.jpg")
                            ],
                          ),
                          Column(
                            children: [
                              _buildInfoItem(
                                  iconData: Icons.play_circle_outline_outlined,
                                  content: Row(
                                    children: [
                                      Text('Germany'),
                                      Icon(Icons.flag)
                                    ],
                                  )),
                              _buildInfoItem(
                                  iconData: Icons.play_circle_outline_outlined,
                                  content: Row(
                                    children: [
                                      Text('Germany'),
                                      Icon(Icons.flag)
                                    ],
                                  )),
                              _buildInfoItem(
                                  iconData: Icons.play_circle_outline_outlined,
                                  content: Row(
                                    children: [
                                      Text('Germany'),
                                      Icon(Icons.flag)
                                    ],
                                  )),
                            ],
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                DotDivider.horizontal()
                /* Container(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final pattern = MosaicSquares.fromHash(hash);
                    return CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: FullPainter(
                            pattern: pattern, background: Colors.blueGrey));
                  }),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({required IconData iconData, required Widget content}) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.red,
        ),
        SizedBox(
          width: 5,
        ),
        content
      ],
    );
  }
}
