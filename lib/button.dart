import 'package:animations/listpage.dart';
import 'package:animations/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TriangleButton extends StatelessWidget {
  final AnimationController controller;
  final AnimationController textController;

  const TriangleButton(this.controller, this.textController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)),
        child: Material(
          color: Colors.indigo,
          child: InkWell(
            onTap: () {
              controller.reverse();
              textController.reverse();
              Future.delayed(const Duration(seconds: 1))
                  .then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => ListPage())));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.adb, color: Colors.white),
                    SizedBox(width: 20),
                    Text('Connexion avec octo', style: AppTextStyles.button),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReverseTriangleButton extends StatelessWidget {
  final AnimationController controller;
  final AnimationController textController;

  const ReverseTriangleButton(this.controller, this.textController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100), bottomLeft: Radius.circular(100)),
        child: Material(
          color: Colors.greenAccent,
          child: InkWell(
            onTap: () {
              controller.reverse();
              textController.reverse();
              Future.delayed(const Duration(seconds: 1))
                  .then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => ListPage())));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.mail_outline, color: Colors.black),
                    const SizedBox(width: 20),
                    Text('Inscrivez vous avec email', style: AppTextStyles.button.copyWith(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final widthFactor = size.width / 48;
    final heightFactor = size.height / 48;
    final path = Path();
    M(x, y) {
      path.moveTo(x * widthFactor, y * heightFactor);
    }
    L(x, y) {
      path.lineTo(x * widthFactor, y * heightFactor);
    }
    C(dx1, dy1, dx2, dy2, dx3, dy3) {
      path.cubicTo(
        dx1 * widthFactor,
        dy1 * heightFactor,
        dx2 * widthFactor,
        dy2 * heightFactor,
        dx3 * widthFactor,
        dy3 * heightFactor,
      );
    }
    M(31.7944, 8);
    L(13.2056, 8);
    C(11.8934, 8, 10.7335, 8.85275, 10.3421, 10.1052);
    L(5.21713, 36.1052);
    C(4.61345, 38.037, 6.05665, 40, 8.08057, 40);
    L(39.9194, 40);
    C(41.9433, 40, 43.3866, 38.037, 42.7829, 36.1052);
    L(37.6579, 10.1052);
    C(37.2665, 8.85275, 36.1066, 8, 34.7944, 8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class _ReverseTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final widthFactor = size.width / 48;
    final heightFactor = size.height / 48;
    final path = Path();
    M(x, y) {
      path.moveTo(x * widthFactor, y * heightFactor);
    }
    L(x, y) {
      path.lineTo(x * widthFactor, y * heightFactor);
    }
    C(dx1, dy1, dx2, dy2, dx3, dy3) {
      path.cubicTo(
        dx1 * widthFactor,
        dy1 * heightFactor,
        dx2 * widthFactor,
        dy2 * heightFactor,
        dx3 * widthFactor,
        dy3 * heightFactor,
      );
    }
    M(31.7944, 8);
    L(13.2056, 8);
    C(11.8934, 8, 10.7335, 8.85275, 10.3421, 10.1052);
    L(5.21713, 36.1052);
    C(4.61345, 38.037, 6.05665, 40, 8.08057, 40);
    L(39.9194, 40);
    C(41.9433, 40, 43.3866, 38.037, 42.7829, 36.1052);
    L(37.6579, 10.1052);
    C(37.2665, 8.85275, 36.1066, 8, 34.7944, 8);
    path.close();
    final rotateMatrix = Float64List.fromList([0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]);
    path.transform(rotateMatrix);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
