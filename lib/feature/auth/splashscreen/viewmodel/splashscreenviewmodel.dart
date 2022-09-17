import 'package:flutter/material.dart';

import '../../slider/view/sliderinformationview.dart';
import '../view/splashscreenview.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SliderInformationView()));
    });
  }
}
