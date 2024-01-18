import 'package:animations/first_octogone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ParisWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 130,
        width: 280,
        child: Stack(
          children: [
            FirstOctogone().animate().slideY(duration: 500.milliseconds, begin: -2, curve: Curves.bounceOut),
            SecondOctogone().animate().then(delay: 250.milliseconds).slideY(duration: 500.milliseconds, begin: -3, curve: Curves.bounceOut),
            ThirdOctogone().animate().then(delay: 150.milliseconds).slideY(duration: 500.milliseconds, begin: -3, curve: Curves.bounceOut),
            FourthOctogone().animate().slideY(duration: 500.milliseconds, begin: -3, curve: Curves.bounceOut),
            FifthOctogone().animate().then(delay: 350.milliseconds).slideY(duration: 500.milliseconds, begin: -3, curve: Curves.bounceOut),
          ],
        ),
      ),
    );
  }
}
