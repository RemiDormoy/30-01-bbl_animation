import 'dart:math';

import 'package:animations/colors.dart';
import 'package:animations/datail_page.dart';
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
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationController4;
  late AnimationController imageController;
  bool shouldPlayImageAnimation = true;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    animationController4 = AnimationController(vsync: this);
    animationController2 = AnimationController(vsync: this);
    animationController3 = AnimationController(vsync: this);
    imageController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        animationController.reverse().whenComplete(
              () => Future.delayed(100.milliseconds).then((value) {
                Navigator.pop(context);
              }),
            );
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
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      _CityCard(
                        position: 1,
                        animationController: animationController,
                        shouldPlayImageAnimation: shouldPlayImageAnimation,
                        onTap: () {
                          shouldPlayImageAnimation = false;
                        },
                        name: 'Nemours',
                        asset: 'assets/nemours.png',
                        country: 'France',
                        trainCo2: 1,
                        carCo2: 18,
                      ),
                      _CityCard(
                        position: 2,
                        animationController: animationController,
                        shouldPlayImageAnimation: shouldPlayImageAnimation,
                        onTap: () {
                          shouldPlayImageAnimation = false;
                        },
                        name: 'Marseille',
                        asset: 'assets/marseille.png',
                        country: 'France',
                        trainCo2: 2,
                        carCo2: 169,
                        planeCo2: 171,
                      ),
                      _CityCard(
                        position: 3,
                        animationController: animationController,
                        shouldPlayImageAnimation: shouldPlayImageAnimation,
                        onTap: () {
                          shouldPlayImageAnimation = false;
                        },
                        name: 'Bali',
                        asset: 'assets/bali.png',
                        country: 'Indonésie',
                        planeCo2: 1884,
                      ),
                      _CityCard(
                        position: 4,
                        animationController: animationController,
                        shouldPlayImageAnimation: shouldPlayImageAnimation,
                        onTap: () {
                          shouldPlayImageAnimation = false;
                        },
                        name: 'Porto',
                        asset: 'assets/porto.png',
                        country: 'Portugal',
                        planeCo2: 228,
                        carCo2: 344,
                        trainCo2: 5,
                      ),
                      _CityCard(
                        position: 5,
                        animationController: animationController,
                        shouldPlayImageAnimation: shouldPlayImageAnimation,
                        onTap: () {
                          shouldPlayImageAnimation = false;
                        },
                        name: 'Helsinki',
                        asset: 'assets/helsinki.png',
                        country: 'Finlande',
                        planeCo2: 358,
                        carCo2: 575,
                        trainCo2: 25,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
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

class _CityCard extends WidgetWithAnimation {
  final AnimationController animationController;
  final String name;
  final String asset;
  final String country;
  final int? trainCo2;
  final int? planeCo2;
  final int? carCo2;
  final int position;
  final bool shouldPlayImageAnimation;
  final void Function() onTap;

  _CityCard({
    required this.animationController,
    required this.name,
    required this.asset,
    required this.country,
    required this.position,
    required this.shouldPlayImageAnimation,
    required this.onTap,
    this.trainCo2,
    this.carCo2,
    this.planeCo2,
  });

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget
        .animate(controller: animationController)
        .fadeIn(duration: 400.milliseconds)
        .then(delay: (150 + 100 * min(position, 3)).milliseconds)
        .slideX(
          duration: 500.milliseconds,
          begin: position % 2 == 0 ? -2 : 2,
          curve: Curves.fastEaseInToSlowEaseOut,
        );
  }

  @override
  Widget createWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        child: Material(
          color: Colors.black45,
          child: InkWell(
            onTap: () {
              onTap();
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage(asset)));
            },
            child: Column(
              children: [
                Hero(
                  tag: asset,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    child: Image.asset(
                      asset,
                      height: 180,
                      width: MediaQuery.sizeOf(context).width - 40,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )
                        .animate(autoPlay: shouldPlayImageAnimation)
                        .scaleXY(end: 1.8, duration: 10.milliseconds)
                        .then(delay: 300.milliseconds)
                        .scaleXY(end: 1 / 1.8, duration: 4.seconds, curve: Curves.fastEaseInToSlowEaseOut),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(name, style: AppTextStyles.subTitle.copyWith(fontSize: 16)),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(Icons.location_on_outlined, color: Colors.white),
                                  const SizedBox(width: 10),
                                  Expanded(child: Text(country, style: AppTextStyles.subTitle.copyWith(fontSize: 16))),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (trainCo2 != null)
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: _getCo2Color(trainCo2!),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.train, color: Colors.white),
                                    const SizedBox(width: 5),
                                    Text(
                                      '$trainCo2 kg de Co2',
                                      style: AppTextStyles.subTitle.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (trainCo2 != null && (carCo2 != null || planeCo2 != null)) const SizedBox(height: 10),
                          if (carCo2 != null)
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: _getCo2Color(carCo2!),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.car_crash, color: Colors.white),
                                    const SizedBox(width: 5),
                                    Text(
                                      '$carCo2 kg de Co2',
                                      style: AppTextStyles.subTitle.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (carCo2 != null && planeCo2 != null) const SizedBox(height: 10),
                          if (planeCo2 != null)
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: _getCo2Color(planeCo2!),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.airplanemode_active, color: Colors.white),
                                    const SizedBox(width: 5),
                                    Text(
                                      '$planeCo2 kg de Co2',
                                      style: AppTextStyles.subTitle.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color? _getCo2Color(int co2) {
  if (co2 > 1000) {
    return Color.lerp(Colors.red, Colors.black, max(1, (co2.toDouble() - 1000.toDouble()) / 2000.toDouble()));
  } else if (co2 > 500) {
    return Color.lerp(
        Colors.orangeAccent, Colors.red, max(1.toDouble(), (co2.toDouble() - 500.toDouble()) / 500.toDouble()));
  } else if (co2 > 300) {
    return Color.lerp(Colors.yellow, Colors.orangeAccent, max(1.toDouble(), (co2 - 300.toDouble()) / 200.toDouble()));
  } else {
    return Color.lerp(Colors.green, Colors.yellow, co2.toDouble() / 300.toDouble());
  }
}
