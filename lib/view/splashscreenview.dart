import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import 'package:storyhub/viewmodel/splashscreenviewmodel.dart';

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
    return Container(
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
    );
  }
}