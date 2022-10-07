import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import '../../slider/view/sliderinformationview.dart';
import '../view/gradientsplashscreenview.dart';

abstract class GradientSplashScreenViewModel
    extends State<GradientSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(PageAnimationTransition(
          page: const SliderInformationView(),
          pageAnimationType: FadeAnimationTransition()));

      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SliderInformationView())); */
    });
  }
}
