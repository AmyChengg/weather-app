import 'package:flutter/material.dart';

class SpaceNeedleInACircle extends StatelessWidget {
  const SpaceNeedleInACircle({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(you): return a Widget that shows the spaceneedle.jpeg (in assets) and clips it to be a circle 
    // hint: check out the ClipOval Widget
    // We want to show a pic of the Space Needle, and inscribe a rectangular image of it in a circle. 
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/spaceneedle.jpeg',
          width: 300,
          height: 300, 
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}