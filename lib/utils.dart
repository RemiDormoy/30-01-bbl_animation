import 'package:flutter/material.dart';

abstract class WidgetWithAnimation extends StatelessWidget {

  Widget createWidget(BuildContext context);

  Widget animateWidget(BuildContext context, Widget widget);

  @override
  Widget build(BuildContext context) {
    return animateWidget(context, createWidget(context));
  }
}