import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var dateTime = DateTime.now();

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

    var minLine = Paint()
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var secLine = Paint()
      ..color = Colors.orange[300]!
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var hrLine = Paint()
      ..shader =
          const RadialGradient(colors: [Colors.orangeAccent, Colors.pink])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var line = Paint()..color = Colors.white;

    var secX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    var minX = centerX + 60 * cos(dateTime.minute * 6 * pi / 180);
    var minY = centerX + 60 * sin(dateTime.minute * 6 * pi / 180);
    var hrX = centerX +
        40 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hrY = centerX +
        40 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawCircle(center, radius - 40,
        innerpaint); //it is inbuilt property to draw the shape circle
    canvas.drawCircle(center, radius - 40, outlinepaint);

    canvas.drawLine(center, Offset(hrX, hrY), hrLine);
    canvas.drawLine(center, Offset(minX, minY), minLine);
    canvas.drawLine(center, Offset(secX, secY), secLine);

    canvas.drawCircle(center, 10, innercircle);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (var i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);
      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), line);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
