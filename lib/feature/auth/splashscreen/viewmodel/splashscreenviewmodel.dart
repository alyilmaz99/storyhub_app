import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/Service/ad_mob_service.dart';
import '../view/gradientsplashscreenview.dart';
import '../view/splashscreenview.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  @override
  void initState() {
    Provider.of<AdMobService>(context, listen: false).initAd();
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.of(context).pushReplacement(PageAnimationTransition(
          page: GradientSplashScreen(
            context: context,
          ),
          pageAnimationType: FadeAnimationTransition()));

      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const GradientSplashScreen())); **/
    });
  }
}
