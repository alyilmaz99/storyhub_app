import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';

import '../viewmodel/gradientsplashscreenviewmodel.dart';

class GradientSplashScreen extends StatefulWidget {
  const GradientSplashScreen({super.key});

  @override
  State<GradientSplashScreen> createState() => _GradientSplashScreenState();
}

class _GradientSplashScreenState extends GradientSplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          colors: [
            Color.fromRGBO(138, 97, 166, 1),
            Color.fromRGBO(58, 29, 88, 1),
            Color.fromRGBO(13, 5, 38, 1),
          ],
          radius: 1,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Image.asset('assets/images/LogoV1.png'),
    ));
  }
}
