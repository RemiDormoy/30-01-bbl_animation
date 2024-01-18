import 'package:animations/text_styles.dart';
import 'package:flutter/material.dart';

class FirstOctogone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 100,
      child: SizedBox(
        height: 300,
        width: 300,
        child: CustomPaint(
          painter: OctogonePainter(Colors.green),
          child: const Center(
              child: Text(
            'P',
            style: AppTextStyles.octogone,
          )),
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
    final width = size.width;
    final height = size.height;
    final Paint paint = Paint()..color = color;
    final path = Path();
    path.moveTo(width / 4, 0);
    path.cubicTo(width / 6, 0, 0, height / 6, 0, height / 4);
    path.lineTo(0, 3 * height / 4);
    path.cubicTo(0, 5 * height / 6, width / 6, height, width / 4, height);
    path.lineTo(3 * width / 4, height);
    path.cubicTo(5 * width / 6, height, width, 5 * height / 6 , width, 3 * height / 4);
    path.lineTo(width, height / 4);
    path.cubicTo(width, height / 6, width * 5 / 6, 0 ,3 * width / 4, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
