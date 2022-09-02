import 'package:flutter/material.dart';

import '../viewmodel/splashscreenviewmodel.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends SplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSizeInfo = MediaQuery.of(context).size;
    var screenHeight = screenSizeInfo.height;
    var screenWidth = screenSizeInfo.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: RadialGradient(center: Alignment.center, colors: [
            Color.fromRGBO(36, 10, 63, 1),
            Color.fromRGBO(13, 5, 38, 1),
          ]),
          image: DecorationImage(
            image: AssetImage('assets/images/LogoV1.png'),
          ),
        ),
      ),
    );

    /* Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.yellow,
            Colors.blue,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              margin: EdgeInsets.only(
                top: screenHeight / 5,
              ),
              // color: Colors.red,
              child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50.0)),
          Text(
            TextConst.splashScreenAppText,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );*/
  }
}
