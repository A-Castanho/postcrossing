import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'dart:math';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;
  final Size preferredSize;

  const CustomAppBar({Key? key, this.actions, this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, // Remove the shadow
      flexibleSpace: _buildFlexSpace(),
      title: title,
      actions: actions,
    );
  }

  Widget _buildFlexSpace() {
    const int repeatCount = 10;
    final double stepSize = 1 / (repeatCount * 3 - 1);

    final List<double> stops = List.empty(growable: true);
    final List<Color> colors = List.empty(growable: true);
    for (var i = 0; i < repeatCount * 3; i++) {
      if (i != 0 && i != (repeatCount * 3) - 1) {
        stops.add(i * stepSize);
      }
      stops.add(i * stepSize);
    }

    for (var i = 0; i < (repeatCount * 3) - 1; i++) {
      _genColor(i, colors);
      _genColor(i, colors);
    }

    print(stops);
    print(colors);
    dev.log(stops.length.toString());
    dev.log(colors.length.toString());

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

  void _genColor(int i, List<Color> colors) {
    if (i % 6 == 0 || i % 6 == 1) {
      colors.add(Color(0xffd72147));
    } else if (i % 6 == 2 || i % 6 == 3) {
      colors.add(Colors.white);
    } else {
      colors.add(Color(0xff3475b9));
    }
  }
}
