/* import 'package:flutter/material.dart';

class DottedBorder extends BoxBorder {
  final Color color;
  final double strokeWidth;
  final double gapWidth;
  final double totalWidth;

  const DottedBorder({
    BorderSide borderSide = const BorderSide(),
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gapWidth = 2.0,
    this.totalWidth = 10.0,
  }) : super(
          side: borderSide,
        );

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  BoxBorder scale(double t) {
    return DottedBorder(
      borderSide: side.scale(t),
      color: color,
      strokeWidth: strokeWidth,
      gapWidth: gapWidth,
      totalWidth: totalWidth,
    );
  }

  @override
  ShapeBorder copyWith({BorderSide? side}) {
    return DottedBorder(
      borderSide: side ?? this.side,
      color: color,
      strokeWidth: strokeWidth,
      gapWidth: gapWidth,
      totalWidth: totalWidth,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final radius = Radius.circular(totalWidth / 2);

    // The gap between the dots is the same as the width of the dots.
    // We calculate the number of dots needed to cover the border length.
    final totalDots = (rect.width / totalWidth).ceil();
    final dotGap = (rect.width - (totalDots * totalWidth)) / (totalDots - 1);

    // Draw the dots.
    for (var i = 0; i < totalDots; i++) {
      final center = Offset(
          rect.left + (totalWidth / 2) + (i * (totalWidth + dotGap)),
          rect.top + (rect.height / 2));
      canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCircle(center: center, radius: radius), radius),
        paint,
      );
    }
  }

  @override
  // TODO: implement bottom
  BorderSide get bottom => throw UnimplementedError();

  @override
  // TODO: implement isUniform
  bool get isUniform => throw UnimplementedError();

  @override
  // TODO: implement top
  BorderSide get top => throw UnimplementedError();
}
 */