import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:screen_config/screen_config.dart';

class DotDivider extends StatelessWidget {
  DotDivider.horizontal({Key? key, double? dividerHeight})
      : this.width = double.infinity,
        this.height = dividerHeight ?? 10,
        super(key: key);

  DotDivider.vertical({Key? key, double? dividerWidth})
      : this.height = double.infinity,
        this.width = dividerWidth ?? 10,
        super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/repeating_dot.png',
              repeat: ImageRepeat.repeat,
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Text('Hello World'),
          ),
        ],
      ),
    );
  }
}

/* enum DotDividerType { horizontal, vertical }

class DotDivider extends StatelessWidget {
  late final double width;
  late final double height;
  late final DotDividerType type;
  DotDivider.horizontal({super.key, double? dividerHeight}) {
    this.width = ScreenConfig.screenWidth;
    height = dividerHeight ?? 10;
    type = DotDividerType.horizontal;
  }
  DotDivider.vertical({super.key, double? dividerWidth}) {
    this.height = ScreenConfig.screenHeight;
    width = dividerWidth ?? 10;
    type = DotDividerType.vertical;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/repeating_dot.png',
              repeat: ImageRepeat.repeat,
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Text('Hello World'),
          ),
        ],
      ),
    );

    //todo make it so it takes available screen space, not all of screens space
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double height;
      double width;
      if (type == DotDividerType.horizontal) {
        width = constraints.maxWidth;
        height = 10;
      } else {
        height = constraints.maxHeight;
        width = 10;
      }
      return SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/images/repeating_dot.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Text('Hello World'),
            ),
          ],
        ),
      );
    });
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/repeating_dot.png',
              repeat: ImageRepeat.repeat,
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Text('Hello World'),
          ),
        ],
      ),
    );
  }
}
 */