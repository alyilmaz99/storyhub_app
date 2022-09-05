import 'package:flutter/cupertino.dart';
import 'dart:async';

class TimerContreller {
  late Timer timer;

  static final TimerContreller _timerContreller= TimerContreller._internal();

  TimerContreller._internal();

  factory TimerContreller(Timer timer) {
    _timerContreller.timer = timer;
    return _timerContreller;
  }

  void controleTimer(int startTimer) {
    if (startTimer < 1) {
      timer.cancel();
    }else {
      startTimer = startTimer - 1;
    }
  }

  bool isCanceledTimer(bool isCanceled){
    this.timer.cancel();
    return isCanceled;
  }
}