import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerDesign extends StatelessWidget {
  const TimerDesign({super.key, required this.seconds});

  final int seconds;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Stack(children: [
      Center(
        child: SizedBox(
          height: screenHeight / 2.2,
          //width: screenHeight /2.2,
          child: Image.asset(
            'assets/images/timerborder.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: CircularCountDownTimer(
            isReverse: true,
            width: screenWidth * 0.50,
            height: screenWidth * 0.50,
            duration: seconds,
            fillColor: Colors.red,
            ringColor: Colors.green,
            strokeWidth: 17,
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'GamerStation',
              fontSize: screenWidth / 4,
            ),
            onComplete: () {
              //
            },
          ),
        ),
      )
    ]);
  }
}
