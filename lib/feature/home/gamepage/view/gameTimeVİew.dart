import 'dart:ffi';

import 'package:flutter/material.dart';

import '../viewmodel/gameTİmeViewModel.dart';


class CountdownTimer extends StatefulWidget {

  int startTimerFrom;
  String? pageText;

  stopTime(){}

  CountdownTimer({
    Key? key,
    required this.startTimerFrom,
    required this.pageText,
  }) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState(startTimerFrom: this.startTimerFrom, pageText: this.pageText);
}

class _CountdownTimerState extends CountdownTimerViewModel {
  _CountdownTimerState({required super.startTimerFrom,required super.pageText});

  @override
  CountdownTimer get widget => super.widget;



  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    //
    // final hours = strDigits(myDuration.inHours.remainder(24));
    // final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Container(
      alignment: Alignment.centerLeft,
      width: screenWidth / 2.6,
      height: screenHeight / 5,
      child: Stack(children: [
        Image.asset(
          'assets/images/timer.png',
          fit: BoxFit.fill,
        ),
            Positioned(
            bottom: 75,
            right: 60,
            child: Text(
              '$seconds',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold),
            )),
      ]),
    );

    //   Scaffold(
    //   body: Center(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 50,
    //         ),
    //         // Step 8
    //         Text(
    //           '$hours:$minutes:$seconds',
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black,
    //               fontSize: 50),
    //         ),
    //         SizedBox(height: 20),
    //         // Step 9
    //         ElevatedButton(
    //           onPressed: startTimer,
    //           child: Text(
    //             'Start',
    //             style: TextStyle(
    //               fontSize: 30,
    //             ),
    //           ),
    //         ),
    //         // Step 10
    //         ElevatedButton(
    //           onPressed: () {
    //             if (countdownTimer == null || countdownTimer!.isActive) {
    //               stopTimer();
    //             }
    //           },
    //           child: Text(
    //             'Stop',
    //             style: TextStyle(
    //               fontSize: 30,
    //             ),
    //           ),
    //         ),
    //         // Step 11
    //         ElevatedButton(
    //             onPressed: () {
    //               resetTimer();
    //             },
    //             child: Text(
    //               'Reset',
    //               style: TextStyle(
    //                 fontSize: 30,
    //               ),
    //             ))
    //       ],
    //     ),
    //   ),
    // );
  }
}