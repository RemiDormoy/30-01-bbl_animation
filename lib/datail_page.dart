import 'package:animations/colors.dart';
import 'package:animations/text_styles.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String image;

  DetailPage(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 2.3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(0),
                      bottom: Radius.circular(60),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 2.3,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 20),
                      child: Text(_name(image), style: AppTextStyles.title),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _name(String image) {
  return switch (image) {
    'assets/nemours.png' => 'Nemours',
    'assets/marseille.png' => 'Marseille',
    'assets/porto.png' => 'Porto',
    'assets/bali.png' => 'Bali',
    _ => 'Helsinki',
  };
}
