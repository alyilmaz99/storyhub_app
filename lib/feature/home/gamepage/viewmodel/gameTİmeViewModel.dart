import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import '../../scenario/view/selectscenarioview.dart';

import '../view/gameTimeVİew.dart';

abstract class CountdownTimerViewModel extends State<CountdownTimer> {
  // Step 2
  int startTimerFrom = 10;
  String? pageText;

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 50);

  CountdownTimerViewModel({
    Key? key,
    required this.startTimerFrom,
    required this.pageText,
  });

  @override
  void initState() {
    myDuration = Duration(seconds: this.startTimerFrom);
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
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
        if (this.pageText == "HomeCardsOrder") {
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectScenarioView()));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => SelectScenarioView(),
            ),
            (route) => false,
          );
        }
        if (this.pageText == "CardPage") {
          if (widget != null) {
            Navigator.pop(context);
          } else {
            if (widget == null) {}
          }
        }
        if (this.pageText == null) {}
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
}
