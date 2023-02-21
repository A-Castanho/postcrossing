import 'package:flutter/material.dart';

buildCustomAppBar() {
  return AppBar(
    flexibleSpace: Container(
      height: kToolbarHeight + 50, // add 50 extra to show stripes
      color: Colors.blue,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: kToolbarHeight),
              Text(
                'title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomPaint(
            painter: StripedPainter(),
            size: Size.infinite,
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
  );
}

class StripedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 30.0;
    const double stripeWidth = strokeWidth;
    const double stripeSpacing = strokeWidth;

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
          Offset(startX, 0), Offset(startX + stripeWidth, size.height), paint);
      startX += stripeWidth + stripeSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
