import 'package:animations/colors.dart';
import 'package:animations/text_styles.dart';
import 'package:animations/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ListCityPage extends StatefulWidget {
  @override
  State<ListCityPage> createState() => _ListCityPageState();
}

class _ListCityPageState extends State<ListCityPage> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        animationController.reverse();
        Future.delayed(600.milliseconds).then((value) => Navigator.pop(context));
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.backgroundTopLeft, AppColors.backgroundBottomRight],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _WelcomeTitle(animationController),
              _SearchChoices(animationController),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeTitle extends WidgetWithAnimation {
  final AnimationController animationController;

  _WelcomeTitle(this.animationController);

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget
        .animate(controller: animationController)
        .blur(duration: 400.milliseconds, begin: const Offset(20, 20));
  }

  @override
  Widget createWidget(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40, left: 30),
      child: Text('Hello Rémi', style: AppTextStyles.title),
    );
  }
}

class _SearchChoices extends WidgetWithAnimation {
  final AnimationController animationController;

  _SearchChoices(this.animationController);

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget;
  }

  @override
  Widget createWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: 20),
          Expanded(
            child:
                _ChoiceChip(position: 1, animationController: animationController, label: 'Explorer', selected: true),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _ChoiceChip(
                position: 2, animationController: animationController, label: 'Rechercher', selected: false),
          ),
          const SizedBox(width: 10),
          Expanded(
            child:
                _ChoiceChip(position: 3, animationController: animationController, label: 'Favoris', selected: false),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _ChoiceChip extends WidgetWithAnimation {
  final int position;
  final AnimationController animationController;
  final String label;
  final bool selected;

  _ChoiceChip({
    required this.position,
    required this.animationController,
    required this.label,
    required this.selected,
  });

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget
        .animate(controller: animationController)
        .then(delay: switch (position) { 1 => 0.milliseconds, 2 => 150.milliseconds, _ => 250.milliseconds })
        .fade(duration: 500.milliseconds)
        .slideY(duration: 500.milliseconds, begin: -3, curve: Curves.bounceOut);
  }

  @override
  Widget createWidget(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.subTitle.copyWith(
              color: selected ? AppColors.backgroundTopLeft : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
