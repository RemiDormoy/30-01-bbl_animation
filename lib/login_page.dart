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
            const _TabBar(),
            Expanded(child: SizedBox(), flex: 1),
            _MailField(mailController, animationController),
            const SizedBox(height: 20),
            _PasswordField(mdpController, animationController),
            Expanded(child: SizedBox(), flex: 1),
          ],
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar();

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
                      Navigator.pop(context);
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
