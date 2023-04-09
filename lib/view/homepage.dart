import 'package:custompainterapp/view/arc/arc.dart';
import 'package:custompainterapp/view/clip/clip.dart';
import 'package:custompainterapp/view/clock/clock.dart';
import 'package:custompainterapp/view/curves/curves.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Custom Painter"),
        elevation: 0,
        backgroundColor: bgColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Center(child: CustomClock())
          // Center(
          //   child: ArcHomepage(),
          // )
          // Center(child: ClipHomePage())

          CurvesHomePage()
        ],
      ),
    );
  }
}
