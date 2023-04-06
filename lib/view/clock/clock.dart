import 'dart:math';

import 'package:flutter/material.dart';

Color bgColor = const Color(0xff2d2f41);

class CustomClock extends StatelessWidget {
  const CustomClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: bgColor,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2; //to find the position of x
    var centerY = size.height / 2; //to find the position of y
    var center =
        Offset(centerX, centerY); // using offset we find the center from origin
    var radius = min(centerX, centerY); //to find the radius we use min

    var innerpaint = Paint()
      ..color = const Color(0xff444974); //paint is used to provide the design
    var outlinepaint = Paint()
      ..color = const Color(0xffeaecff)
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    var innercircle = Paint()..color = const Color(0xffeaecff);

    canvas.drawCircle(center, radius - 40,
        innerpaint); //it is inbuilt property to draw the shape circle
    canvas.drawCircle(center, radius - 40, outlinepaint);
    canvas.drawCircle(center, 10, innercircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
