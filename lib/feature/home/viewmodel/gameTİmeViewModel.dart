import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';

import '../view/gameTimeVİew.dart';


abstract class CountdownTimerViewModel extends State<CountdownTimer> {
  // Step 2
  int startTimerFrom = 10;

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 50);



  CountdownTimerViewModel({
    Key? key,
    required this.startTimerFrom,
  });

  @override
  void initState() {
    myDuration = Duration(seconds: this.startTimerFrom);
    super.initState();
  }
  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(seconds: this.startTimerFrom));
  }
  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
}