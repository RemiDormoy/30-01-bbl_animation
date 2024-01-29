import 'package:animations/button.dart';
import 'package:animations/colors.dart';
import 'package:animations/login_page.dart';
import 'package:animations/paris.dart';
import 'package:animations/text_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController parisController;
  late AnimationController textController;

  @override
  void initState() {
    super.initState();
    parisController = AnimationController(vsync: this);
    textController = AnimationController(vsync: this);
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
            const SizedBox(height: 40),
            const Center(child: Text('Bienvenue à', style: AppTextStyles.title)),
            const SizedBox(height: 40),
            ParisWidget(parisController),
            const SizedBox(height: 50),
            _Subtitle(),
            const SizedBox(height: 20),
            _ButtonWithAnim(parisController, textController),
            const SizedBox(height: 5),
            const Center(child: Text('Ou', style: AppTextStyles.subTitle)),
            const SizedBox(height: 5),
            _ButtonReverseWithAnim(parisController, textController),
            const SizedBox(height: 40),
            const Center(child: Text('Vous avez déjà un compte ?', style: AppTextStyles.subTitle)),
            _ShitButtonWithAnim(parisController, textController),
          ],
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          'Pour commencer à jouer, vous pouvez',
          style: AppTextStyles.subTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ButtonWithAnim extends StatelessWidget {
  final AnimationController controller;
  final AnimationController textController;

  const _ButtonWithAnim(this.controller, this.textController);

  @override
  Widget build(BuildContext context) {
    return TriangleButton(controller, textController);
  }
}

class _ButtonReverseWithAnim extends StatelessWidget {
  final AnimationController controller;
  final AnimationController textController;

  const _ButtonReverseWithAnim(this.controller, this.textController);

  @override
  Widget build(BuildContext context) {
    return ReverseTriangleButton(controller, textController);
  }
}

class _ShitButtonWithAnim extends StatelessWidget {
  final AnimationController controller;
  final AnimationController textController;

  const _ShitButtonWithAnim(this.controller, this.textController);

  @override
  Widget build(BuildContext context) {
    return _ShitButton(controller, textController);
  }
}

class _ShitButton extends StatelessWidget {
  final AnimationController controller;
  final AnimationController textController;

  const _ShitButton(this.controller, this.textController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Material(
          color: Colors.amber,
          child: InkWell(
            onTap: () {
              _goToLogin(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.mail_outline, color: Colors.black),
                    const SizedBox(width: 20),
                    Text('Connectez vous', style: AppTextStyles.button.copyWith(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
  }
}
