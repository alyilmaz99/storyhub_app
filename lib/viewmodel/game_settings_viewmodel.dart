import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../core/components/TimerContreller.dart';
import '../view/game_settings_view.dart';

abstract class GameSettingsViewModel extends State<GameSettingsView> {

  GameSettingsViewModel(int startTime)
  {
    this.startTimer = startTime;
  }

  late int startTimer ;
  int maxTimerTime = 80;
  int minTimerTime = 20;
  bool canceltimer = false;


  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        TimerContreller timeContreller = TimerContreller(t);
        if(timeContreller.isCanceledTimer(canceltimer)){
          timeContreller.controleTimer(startTimer);
        }
      });
    });
  }

  void increaseTimer() {
    setState(() {
      if(startTimer < maxTimerTime)
        startTimer += 5;
    });
  }

  void decreaseTimer() {
    setState(() {
      if(startTimer > minTimerTime)
        startTimer -= 5;
    });
  }

  String TimerText() {
    return startTimer.toString();
  }
}