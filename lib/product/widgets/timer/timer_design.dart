import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/settings/model/game_settings_model.dart';

class TimerDesign extends StatelessWidget {
  TimerDesign({super.key, required this.myController, required this.seconds});
  CountDownController? myController;
  void pauseTimer() {
    myController!.pause();
  }

  void resumeTimer() {
    myController!.resume();
  }

  final int seconds;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Stack(children: [
      Center(
        child: SizedBox(
          height: screenHeight / 2.7,
          //width: screenHeight /2.2,
          child: Image.asset(
            'assets/images/timerlast.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      Center(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 11.5),
          child: Consumer<GameSettingsModel>(
            builder: (context, value, child) {
              return CircularCountDownTimer(
                controller: myController,
                isReverse: true,
                width: screenWidth * 0.40,
                height: screenWidth * 0.40,
                duration: value.getTimerValue(),
                fillColor: Colors.red,
                ringColor: Colors.green,
                strokeWidth: 16,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GamerStation',
                  fontSize: screenWidth / 4.5,
                ),
                onComplete: () {
                  //
                },
              );
            },
          ),
        ),
      )
    ]);
  }
}
