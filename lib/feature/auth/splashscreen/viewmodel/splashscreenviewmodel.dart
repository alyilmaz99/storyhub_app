import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/gradientsplashscreenview.dart';
import '../view/splashscreenview.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('showMainPage', true);
      Navigator.of(context).pushReplacement(PageAnimationTransition(
          page: const GradientSplashScreen(),
          pageAnimationType: FadeAnimationTransition()));

      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const GradientSplashScreen())); **/
    });
  }
}
