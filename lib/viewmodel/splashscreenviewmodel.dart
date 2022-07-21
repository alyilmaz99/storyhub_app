import 'package:flutter/material.dart';
import 'package:storyhub/view/sliderinformationview.dart';
import 'package:storyhub/view/splashscreenview.dart';

abstract class SplashScreenViewModel extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SliderInformationView()));
    });
  }
}
