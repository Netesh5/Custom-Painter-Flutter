import 'package:flutter/material.dart';

class ArcHomepage extends StatelessWidget {
  const ArcHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: ArcPainter(),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var arc1 = Path()
      ..moveTo(size.width * 0.2, size.height * 0.2)
      ..arcToPoint(Offset(size.width * 0.9, size.height * 0.2),
          radius: const Radius.circular(150), clockwise: false);
    var arc2 = Path()
      ..moveTo(size.width * 0.2, size.height * 0.2)
      ..arcToPoint(
        Offset(size.width * 0.9, size.height * 0.2),
        radius: const Radius.circular(150),
      );

    canvas.drawPath(arc1, paint);
    canvas.drawPath(arc2, paint);

    var circle = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var center = Offset(size.width / 2, size.height * 0.2);

    canvas.drawCircle(center, 30, circle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
