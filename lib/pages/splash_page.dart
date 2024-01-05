import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:banking_app/main.dart';
import 'package:banking_app/pages/home_page.dart';
import 'package:banking_app/pages/onBoarding_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //   Future.delayed(
  //     const Duration(seconds: 2),
  //     () {
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //           builder: (_) => const MyHomePage(
  //                 title: 'Food',
  //               )));
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xFF1E1E1E),
      duration: 1000,
      splashIconSize: double.infinity,
      splash: Center(
        child: Image.asset(
          'assets/icons/splash_icon.png',
          height: 200,
          width: 200,
        ),
      ),
      nextScreen: initScreen == 0 || initScreen == null
          ? const OnBoardingPage()
          : const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
