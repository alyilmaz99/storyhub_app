import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:storyhub/feature/auth/splashscreen/view/gradientsplashscreenview.dart';
import '../view/splashscreenview.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(PageAnimationTransition(page: const GradientSplashScreen(), pageAnimationType: FadeAnimationTransition()));

      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const GradientSplashScreen())); **/
    });
  }
}
