import 'package:flutter/material.dart';

import 'package:storyhub/product/widgets/timer/timer_design.dart';

class TimerTest extends StatelessWidget {
  const TimerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(center: Alignment.center, colors: [
          Color.fromARGB(255, 60, 10, 63),
          Color.fromRGBO(13, 5, 38, 1),
        ])),
        child: const Center(
          child: TimerDesign(seconds: 20),
        ),
      ),
    );
  }
}