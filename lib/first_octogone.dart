import 'package:animations/text_styles.dart';
import 'package:flutter/material.dart';

class FirstOctogone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      child: SizedBox(
        height: 80,
        width: 80,
        child: CustomPaint(
          painter: OctogonePainter(Colors.green),
          child: const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'P',
              style: AppTextStyles.octogone,
              textAlign: TextAlign.center,
            ),
          )),
        ),
      ),
    );
  }
}

class SecondOctogone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 50,
      child: SizedBox(
        height: 80,
        width: 80,
        child: CustomPaint(
          painter: OctogonePainter(Colors.blueAccent),
          child: const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'A',
              style: AppTextStyles.octogone,
              textAlign: TextAlign.center,
            ),
          )),
        ),
      ),
    );
  }
}

class ThirdOctogone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 95,
      child: SizedBox(
        height: 80,
        width: 80,
        child: CustomPaint(
          painter: OctogonePainter(Colors.deepPurple),
          child: const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'R',
              style: AppTextStyles.octogone,
              textAlign: TextAlign.center,
            ),
          )),
        ),
      ),
    );
  }
}

class FourthOctogone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 140,
      child: SizedBox(
        height: 80,
        width: 80,
        child: CustomPaint(
          painter: OctogonePainter(Colors.amber),
          child: const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'I',
              style: AppTextStyles.octogone,
              textAlign: TextAlign.center,
            ),
          )),
        ),
      ),
    );
  }
}

class FifthOctogone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 200,
      child: SizedBox(
        height: 80,
        width: 80,
        child: CustomPaint(
          painter: OctogonePainter(Colors.pink),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'S',
                style: AppTextStyles.octogone,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OctogonePainter extends CustomPainter {
  final Color color;

  OctogonePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final widthFactor = size.width / 128;
    final heightFactor = size.height / 128;
    final Paint paint = Paint()..color = color;
    final path = Path();
    final M = (x, y) {
      path.moveTo(x * widthFactor, y * widthFactor);
    };
    final a = (a, b, c, d, e, f, g) {
      path.relativeArcToPoint(
        Offset(f + widthFactor, g * heightFactor),
        radius: Radius.circular(a * widthFactor),
        rotation: c.toDouble(),
        largeArc: d == 1,
        clockwise: e == 1,
      );
    };
    final l = (dx, dy) {
      path.relativeLineTo(dx * widthFactor, dy * heightFactor);
    };
    M(59, 2.8867513459481);
    a(10, 10, 0, 0, 1, 10, 0);
    l(45.425625842204, 26.226497308104);
    a(10, 10, 0, 0, 1, 5, 8.6602540378444);
    l(0, 52.452994616207);
    a(10, 10, 0, 0, 1, -5, 8.6602540378444);
    l(-45.425625842204, 26.226497308104);
    a(10, 10, 0, 0, 1, -10, 0);
    l(-45.425625842204, -26.226497308104);
    a(10, 10, 0, 0, 1, -5, -8.6602540378444);
    l(0, -52.452994616207);
    a(10, 10, 0, 0, 1, 5, -8.6602540378444);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
