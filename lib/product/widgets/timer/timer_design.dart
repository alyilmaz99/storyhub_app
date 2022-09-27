import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';
import 'package:storyhub/feature/settings/viewmodel/game_settings_viewmodel.dart';
import 'package:storyhub/main.dart';

class TimerDesign extends StatelessWidget {
   TimerDesign(
      {super.key, required myController});
      CountDownController? myController;
    void pauseTimer(){
       myController!.pause();
    }

    void resumeTimer(){
      myController!.resume();
    }

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
        child: Consumer<GameSettingsModel>(
          builder: (context, value, child){
            return CircularCountDownTimer(
            isReverse: true,
            width: screenWidth /2.6,
            height: screenWidth / 2.6,
            duration: value.getTimerValue(),
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
            
          );
          } ,
         
        ),
      )
        ]),
    );
  }
}
