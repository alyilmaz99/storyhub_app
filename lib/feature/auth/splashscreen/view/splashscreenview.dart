import 'package:flutter/material.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import '../viewmodel/splashscreenviewmodel.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends SplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(127, 188, 210, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              TextConst.vessacTxt,
              style: TextStyle(
                fontFamily: 'SharyBold',
                fontSize: 50,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              TextConst.gameTxt,
              style: TextStyle(
                fontFamily: 'SharyBold',
                fontSize: 40,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              TextConst.studiosTxt,
              style: TextStyle(
                fontFamily: 'SharyBold',
                fontSize: 40,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
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
