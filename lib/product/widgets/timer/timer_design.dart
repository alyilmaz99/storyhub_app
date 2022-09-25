import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/main.dart';

class TimerDesign extends StatelessWidget {
  const TimerDesign(
      {super.key, required this.seconds, this.myHeight, this.myWidth});
  final double? myHeight;
  final double? myWidth;
  final int seconds;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Expanded(
      flex: 5,
      child: Stack(
      children: [
      Center(
        child: Image.asset(
          'assets/images/timer_border.png',
          fit: BoxFit.fill,
          height: screenHeight / 2.6,
         // width: screenHeight /3,
        ),
      ),
      Center(
        child: CircularCountDownTimer(
          isReverse: true,
          width: screenWidth /2.6,
          height: screenWidth / 2.6,
          duration: seconds,
          fillColor: Colors.red,
          ringColor: Colors.green,
          strokeWidth: 17,
          textStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'GamerStation',
            fontSize: screenWidth / 5,
          ),
          onComplete: () {
            //
          },
        ),
      )
        ]),
    );
  }
}
