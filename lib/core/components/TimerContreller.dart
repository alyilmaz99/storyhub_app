import 'package:flutter/cupertino.dart';
import 'dart:async';

class TimerContreller {
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  static final TimerContreller _timerContreller= TimerContreller._internal();

  TimerContreller._internal();

  factory TimerContreller(Timer countdownTimer) {
    _timerContreller.countdownTimer = countdownTimer;
    return _timerContreller;
  }
  //
  // void stopTimer() {
  //   setState(() => countdownTimer!.cancel());
  // }
  //
  // void resetTimer() {
  //   stopTimer();
  //   setState(() => myDuration = Duration(days: 5));
  // }
  //
  // void startTimer() {
  //   countdownTimer =
  //       Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  // }
  //
  // void setCountDown() {
  //   final reduceSecondsBy = 1;
  //   setState(() {
  //     final seconds = myDuration.inSeconds - reduceSecondsBy;
  //     if (seconds < 0) {
  //       countdownTimer!.cancel();
  //     } else {
  //       myDuration = Duration(seconds: seconds);
  //     }
  //   });
  // }




}