import 'package:animations/listpage.dart';
import 'package:animations/text_styles.dart';
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
                  .then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => ListPage())).then((value) {
                controller.forward();
                textController.forward();
              }));
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
                  .then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => ListPage())).then((value) {
                        controller.forward();
                        textController.forward();
                      }));
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
