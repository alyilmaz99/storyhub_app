import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/Service/CardService.dart';
import '../viewmodel/gradientsplashscreenviewmodel.dart';

class GradientSplashScreen extends StatefulWidget {
  GradientSplashScreen({super.key, BuildContext? context}) {
    Provider.of<CardService>(context!, listen: false).initCardFromFirebase();
  }

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
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: SvgPicture.asset(
          'assets/images/LogoV1.svg',
        ),
      ),
    ));
  }
}
