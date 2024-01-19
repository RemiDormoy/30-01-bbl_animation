import 'package:animations/colors.dart';
import 'package:animations/text_styles.dart';
import 'package:animations/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  final TextEditingController mailController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();

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
        Future.delayed(1.seconds).then((value) => Navigator.pop(context));
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
              _TabBar(animationController),
              const Expanded(flex: 2, child: SizedBox()),
              _MailField(mailController, animationController),
              const SizedBox(height: 20),
              _PasswordField(mdpController, animationController),
              const SizedBox(height: 40),
              _LoginButton(animationController),
              const Expanded(flex: 1, child: SizedBox()),
              _ForgotPasswordButton(animationController),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  final AnimationController animationController;

  const _TabBar(this.animationController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      animationController.reverse();
                      Future.delayed(1.seconds).then((value) => Navigator.pop(context));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_circle_left_outlined,
                        color: AppColors.greenButton,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Center(child: Text('Login', style: AppTextStyles.title)),
          ),
        ],
      ),
    );
  }
}

class _MailField extends WidgetWithAnimation {
  final TextEditingController textController;
  final AnimationController animationController;

  _MailField(this.textController, this.animationController);

  @override
  Widget createWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextField(
          controller: textController,
          obscureText: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            label: Center(child: Text('Email')),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget
        .animate(controller: animationController)
        .then(delay: 250.milliseconds)
        .fadeIn(duration: 500.milliseconds)
        .slideY(duration: 700.milliseconds, begin: -10, curve: Curves.fastEaseInToSlowEaseOut);
  }
}

class _PasswordField extends WidgetWithAnimation {
  final TextEditingController textController;
  final AnimationController animationController;

  _PasswordField(this.textController, this.animationController);

  @override
  Widget createWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextField(
          controller: textController,
          obscureText: false,
          inputFormatters: [_DiamondFormatter()],
          //obscuringCharacter: '💎',
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            label: Center(child: Text('Mot de passe')),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget
        .animate(controller: animationController)
        .fadeIn(duration: 500.milliseconds)
        .slideY(duration: 700.milliseconds, begin: -20, curve: Curves.fastEaseInToSlowEaseOut);
  }
}

class _DiamondFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var characters2 = newValue.text.characters;
    final string = characters2
        .map((e) {
          if (e == ' ') return '';
          var s = e == '💎' ? e : '💎';
          return s;
        })
        .toString()
        .replaceAll(',', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '');
    return TextEditingValue(text: string);
  }
}

class _LoginButton extends WidgetWithAnimation {
  final AnimationController animationController;

  _LoginButton(this.animationController);

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget
        .animate(controller: animationController)
        .then(delay: 200.milliseconds)
        .fadeIn(duration: 500.milliseconds)
        .slideY(
          delay: 200.milliseconds,
          duration: 400.milliseconds,
          begin: 5,
          curve: Curves.fastEaseInToSlowEaseOut,
        );
  }

  @override
  Widget createWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100), bottomLeft: Radius.circular(100)),
        child: Material(
          color: Colors.greenAccent,
          child: InkWell(
            onTap: () {
              // TODO
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Center(
                child: Text('Login', style: AppTextStyles.button.copyWith(color: Colors.black)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordButton extends WidgetWithAnimation {
  final AnimationController animationController;

  _ForgotPasswordButton(this.animationController);

  @override
  Widget animateWidget(BuildContext context, Widget widget) {
    return widget.animate(controller: animationController)
        .blur(duration: 400.milliseconds, begin: const Offset(20, 20));
  }

  @override
  Widget createWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Text('Mot de passe oublié ?', style: AppTextStyles.subTitle.copyWith(fontSize: 16))),
        const SizedBox(height: 10),
        Center(
            child: Text('Réinitialiser'.toUpperCase(),
                style: AppTextStyles.subTitle.copyWith(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))),
      ],
    );
  }
}
