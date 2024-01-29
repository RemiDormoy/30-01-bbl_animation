import 'package:animations/first_octogone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ParisWidget extends StatelessWidget {
  final AnimationController controller;

  const ParisWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 130,
        width: 280,
        child: Stack(
          children: [
            FirstOctogone(),
            SecondOctogone(),
            ThirdOctogone(),
            FourthOctogone(),
            FifthOctogone(),
          ],
        ),
      ),
    );
  }
}
