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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(127, 188, 210, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "VESSAC",
              style: TextStyle(
                fontFamily: 'SharyBold',
                fontSize: 50,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "GAME",
              style: TextStyle(
                fontFamily: 'SharyBold',
                fontSize: 40,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "STUDIOS",
              style: TextStyle(
                fontFamily: 'SharyBold',
                fontSize: 40,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 9),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width / 9,
              height: MediaQuery.of(context).size.height / 18,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vessac.png'),
                  fit: BoxFit.fill,
                ),
              ),
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
