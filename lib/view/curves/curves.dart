import 'package:flutter/material.dart';

class CurvesHomePage extends StatelessWidget {
  const CurvesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 300,
              color: Colors.deepOrangeAccent,
            ),
          )
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 2, size.height - 150, size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    // ..quadraticBezierTo(
    //     size.width / 5, size.height, size.width / 2, size.height - 50)
    // ..quadraticBezierTo(size.width - (size.width / 3), size.height - 100,
    //     size.width, size.height - 10);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
