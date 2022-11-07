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
              height: MediaQuery.of(context).size.height / 5,
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 4),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vessac2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
