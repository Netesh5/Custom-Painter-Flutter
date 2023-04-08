import 'package:custompainterapp/view/clip/next_page.dart';
import 'package:flutter/material.dart';

class ClipHomePage extends StatelessWidget {
  const ClipHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const NextPage()));

        Navigator.push(context, PageRouteBuilder(
            pageBuilder: ((context, animation, secondaryAnimation) {
          return const NextPage();
        })));
      },
      child: Hero(
        tag: "background",
        child: ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var roundness = 50.0;
    var path = Path();
    // ..moveTo(0, size.height * 0.3)
    // ..lineTo(0, size.height - roundness)
    // ..quadraticBezierTo(0, size.height, roundness, size.height)

    // // 0 is x coordinate of controller, size.height is y coordinate of contoller
    // //and third and fourth is desnitation point

    // ..lineTo(size.width - roundness, size.height)
    // ..quadraticBezierTo(
    //     size.width, size.height, size.width, size.height - roundness)
    // ..lineTo(size.width, roundness)
    // ..quadraticBezierTo(size.width, 0, size.width - roundness, roundness);

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundness);
    path.quadraticBezierTo(0, size.height, roundness, size.height);
    path.lineTo(size.width - roundness, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundness);
    path.lineTo(size.width, roundness * 2);
    path.quadraticBezierTo(size.width - 10, roundness,
        size.width - roundness * 1.5, roundness * 1.5);
    path.lineTo(roundness * 0.6, size.height * 0.33 - roundness * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundness);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
