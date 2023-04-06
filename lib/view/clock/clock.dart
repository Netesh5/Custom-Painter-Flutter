import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets/clockpainter.dart';

Color bgColor = const Color(0xff2d2f41);

class CustomClock extends StatefulWidget {
  const CustomClock({super.key});

  @override
  State<CustomClock> createState() => _CustomClockState();
}

class _CustomClockState extends State<CustomClock> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: bgColor,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}
